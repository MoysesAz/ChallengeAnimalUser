//
//  AnimalsController.swift
//  ChallengeAnimalUser
//  Created by Moyses Miranda do Vale Azevedo on 28/11/22.
//

import UIKit
import CloudKit

final class PetViewController: UIViewController {
    var viewModel: PetViewModel
    var contentView: PetViewProtocol
    var records: [CKRecord] = []
    var isSearch: Bool = false
    var searchController: UISearchController = UISearchController(searchResultsController: nil)

    init(contentView: some PetViewProtocol = PetView(),
         viewModel: PetViewModel) {
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

        self.title = viewModel.titleView
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.searchController.searchBar.delegate = self
        self.navigationItem.searchController = self.searchController

        self.navigationItem.backButtonTitle = "Abrigos"

        createFilterNavigationItem()

        contentView.tableAnimal.delegate = self
        contentView.tableAnimal.dataSource = self
        contentView.loadData()
//        cloudRepository.filterRecords(recordType: .animal, dataBase: cloudRepository.publishContainer)
//        let filter = NSPredicate(format: "shelterId == %@", viewModel.shelterId)
//        cloudRepository.filterRecords(recordType: .animal, dataBase: cloudRepository.publishContainer, filter: filter)
//        contentView.loadData()
//        cloudRepository.cacheRecords.bind { value in
//            DispatchQueue.main.async() {
//                if value != nil {
//                    guard let value else {return}
//                    self.records = value.map { $0 }
//                    self.contentView.configure()
//                    self.contentView.tableAnimal.reloadData()
//                }
//            }
//        }
    }

    func createFilterNavigationItem() {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "line.3.horizontal.decrease"), for: .normal)
        button.addTarget(self, action: #selector(filterAnimals), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }

    @objc func filterAnimals() {
        print("Helo")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension PetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ImagesFormTableViewController(form: .rgData)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension PetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Animais disponíveis"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = viewModel.makeCell(tableView, cellForRowAt: indexPath, records: records) else {
            return UITableViewCell()
        }
        return cell
    }
}

extension PetViewController: UISearchBarDelegate {}
