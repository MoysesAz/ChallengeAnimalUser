//
//  AnimalsController.swift
//  ChallengeAnimalUser
//  swiftlint: disable force_cast
//  Created by Moyses Miranda do Vale Azevedo on 28/11/22.
//

import UIKit
import CloudKit

class PetViewController: UIViewController {
    var viewModel: PetViewModel
    var contentView: PetViewProtocol
    var cloudRepository: ICloudRepositoryProtocol
    var testeRecord: [CKRecord] = []

    init(cloudRepository: some ICloudRepositoryProtocol,
         contentView: some PetViewProtocol = PetView(),
         viewModel: PetViewModel) {
        self.cloudRepository = cloudRepository
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func loadView() {
        self.view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel.titleView
        navigationItem.largeTitleDisplayMode = .automatic

        contentView.tableAnimal.register(PetTableViewCell.self, forCellReuseIdentifier: PetTableViewCell.identifier)
        contentView.tableAnimal.delegate = self
        contentView.tableAnimal.dataSource = self
        contentView.loadData()
//        cloudRepository.filterRecords(recordType: .animal, dataBase: cloudRepository.publishContainer)
//        let filter = NSPredicate(format: "shelterId == %@", viewModel.shelterId)
//        cloudRepository.filterRecords(recordType: .animal, dataBase: cloudRepository.publishContainer, filter: filter)

//        cloudRepository.cacheRecords.bind { value in
//            DispatchQueue.main.async {
//                if value != nil {
//                    guard let value else {return}
//                    self.testeRecord = value.map { $0 }
//                    self.contentView.configure()
//                    self.contentView.tableAnimal.reloadData()
//                }
//            }
//        }
    }
}

extension PetViewController: UITableViewDelegate {}

extension PetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 97
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PetTableViewCell.identifier,
            for: indexPath
        ) as? PetTableViewCell else {
            return UITableViewCell()
        }

//        let name = testeRecord[indexPath.row].value(forKey: "nameAnimal") as! String
//        let image: CKAsset = testeRecord[indexPath.row].object(forKey: "image") as! CKAsset
//
//        let imageURL: URL? = URL(string: image.fileURL!.absoluteString)
//        let cellInfo = Pet(name: name, image: imageURL, age: 10, isNeutered: true)

//        cell.petInfo = cellInfo

        return cell
    }
}
