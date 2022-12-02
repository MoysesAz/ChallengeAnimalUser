//
//  ViewController.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 25/11/22.
//  swiftlint:disable force_cast

import UIKit
import CloudKit

protocol ShelterViewControllerDelegate: AnyObject {}

class ShelterViewController: UIViewController {
    var viewModel: ShelterViewModel
    var contentView: SheltersViewProtocol
    var cloudRepository: ICloudRepositoryProtocol
    var records: [CKRecord] = []
    var searchRecord: [CKRecord] = []

    var isSearch: Bool = false
    var searchController: UISearchController = UISearchController(searchResultsController: nil)

    init(cloudRepository: some ICloudRepositoryProtocol,
         contentView: some SheltersViewProtocol = ShelterView(),
         viewModel: ShelterViewModel = ShelterViewModel()) {
        self.cloudRepository = cloudRepository
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Abrigos próximos"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.searchController.searchBar.delegate = self
        self.navigationItem.searchController = self.searchController

        contentView.tableShelters.register(
            ShelterTableViewCell.self,
            forCellReuseIdentifier: ShelterTableViewCell.identifier
        )
        contentView.tableShelters.delegate = self
        contentView.tableShelters.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cloudRepository.filterRecords(recordType: .shelter, dataBase: cloudRepository.publishContainer)
        contentView.loadData()
        cloudRepository.cacheRecords.bind { value in
            DispatchQueue.main.async {
                if value != nil {
                    guard let value else {return}
                    self.records = value.map { $0 }
                    self.searchRecord = self.records
                    self.contentView.tableShelters.reloadData()
                    self.contentView.configure()
                }
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Abrigos"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }

}

extension ShelterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = records[indexPath.row].recordID
        let title = records[indexPath.row].value(forKey: "shelterName") as! String
        let reference = CKRecord.Reference(recordID: id, action: .none)
        let viewModel = PetViewModel(shelterId: reference, titleView: title)
        let repository = CKContainer(identifier: "iCloud.Mirazev.AnimalUser").publicCloudDatabase
        let cloudRepository = ICloudRepository(publishContainer: repository)
        let controller = PetViewController(cloudRepository: cloudRepository, viewModel: viewModel)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension ShelterViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 97
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchRecord.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return makeShelterCell(tableView, cellForRowAt: indexPath)
    }

}

// MARK: - Mover para a camada ViewModel
extension ShelterViewController {
    func makeShelterCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ShelterTableViewCell.identifier,
            for: indexPath
        ) as? ShelterTableViewCell else {
            return UITableViewCell()
        }

        let name = searchRecord[indexPath.row].value(forKey: "shelterName") as! String
        let image: CKAsset = searchRecord[indexPath.row].object(forKey: "logo") as! CKAsset
        let imageURL: URL? = URL(string: image.fileURL!.absoluteString)
        let cellInfo = Shelter(name: name, image: imageURL)
        cell.shelterInfo = cellInfo
        return cell
    }
}

extension ShelterViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            guard let value =  cloudRepository.cacheRecords.value else {return}
            searchRecord = value
        } else {
            searchRecord = records.filter({
                guard let value = $0.value(forKey: "shelterName") else { return false }
                guard let name = value as? String else { return false }
                return name.lowercased().stripingDiacritics.contains(searchText.lowercased().stripingDiacritics)
            })
        }
        contentView.tableShelters.reloadData()

    }
}
