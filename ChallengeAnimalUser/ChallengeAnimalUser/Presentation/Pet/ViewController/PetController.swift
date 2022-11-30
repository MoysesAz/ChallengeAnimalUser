//
//  AnimalsController.swift
//  ChallengeAnimalUser
//  swiftlint: disable force_cast
//  Created by Moyses Miranda do Vale Azevedo on 28/11/22.
//

import UIKit
import CloudKit

class ListOfAnimalsController: UIViewController {
    var viewModel: ListOfAnimalsViewModel
    var contentView: AnimalViewProtocol
    var cloudRepository = ICloudRepository(
        publishContainer: CKContainer(identifier: "iCloud.Mirazev.AnimalUser").publicCloudDatabase)
    var teste: [String] = []

    init(contentView: some AnimalViewProtocol = AnimalView(),
         viewModel: ListOfAnimalsViewModel) {
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
        contentView.tableAnimal.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        contentView.tableAnimal.delegate = self
        contentView.tableAnimal.dataSource = self
        contentView.loadData()
//        cloudRepository.filterRecords(recordType: .animal, dataBase: cloudRepository.publishContainer)
        let filter = NSPredicate(format: "shelterId == %@", viewModel.shelterId)
        cloudRepository.filterRecords(recordType: .animal, dataBase: cloudRepository.publishContainer, filter: filter)

        cloudRepository.cacheRecords.bind { value in
            DispatchQueue.main.async {
                if value != nil {
                    guard let value else {return}
                    self.teste = value.map { $0.value(forKey: "nameAnimal") as! String}
                    self.contentView.configure()
                    self.contentView.tableAnimal.reloadData()
                }
            }
        }
    }
}

extension ListOfAnimalsController: UITableViewDelegate {}

extension ListOfAnimalsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teste.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contentView.tableAnimal.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = teste[indexPath.row]
        return cell
    }
}
