//
//  ViewController.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 25/11/22.
//  swiftlint:disable force_cast

import UIKit
import CloudKit

protocol ShelterViewControllerDelegate: AnyObject {

}

class ShelterViewController: UIViewController {
    var viewModel: ShelterViewModel
    var contentView: SheltersViewProtocol
    var mycloud = MyCloud()
    var teste = ["São Lazaro", "Abrigo dos Gatos"]
    var teste2: [Shelter] = []
    var testeRecord: [CKRecord] = []

    init(contentView: some SheltersViewProtocol = ShelterView(),
         viewModel: ShelterViewModel = ShelterViewModel()) {
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
        contentView.tableShelters.register(
            ShelterTableViewCell.self,
            forCellReuseIdentifier: ShelterTableViewCell.identifier
        )
        contentView.tableShelters.delegate = self
        contentView.tableShelters.dataSource = self
        mycloud.filterRecords(recordType: .shelter, dataBase: mycloud.publishContainer)
        mycloud.cache.bind { value in
            DispatchQueue.main.async {
                if value != nil {
                    guard let value else {return}
                    print(value)
                    self.testeRecord = value.map { $0 }
                    self.contentView.tableShelters.reloadData()
                }
            }
        }
    }
}

extension ShelterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = ListOfAnimalsViewModel(animalID: indexPath.row)
        let controller = ListOfAnimalsController(viewModel: viewModel)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension ShelterViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testeRecord.count
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

        let name = testeRecord[indexPath.row].value(forKey: "shelterName") as! String
        let image: CKAsset = testeRecord[indexPath.row].object(forKey: "logo") as! CKAsset

        let imageURL: URL? = URL(string: image.fileURL!.absoluteString)
        let cellInfo = Shelter(name: name, image: imageURL)

        cell.shelterInfo = cellInfo

        return cell
    }
}

