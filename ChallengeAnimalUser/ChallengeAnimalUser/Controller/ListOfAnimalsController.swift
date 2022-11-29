//
//  AnimalsController.swift
//  ChallengeAnimalUser
//  swiftlint: disable force_cast
//  Created by Moyses Miranda do Vale Azevedo on 28/11/22.
//

import UIKit

class ListOfAnimalsController: UIViewController {
    var viewModel: ListOfAnimalsViewModel
    var contentView: ListOfAnimalsViewProtocol
    var mycloud = MyCloud()
    var teste = ["Amor", "Gravidade", "Cafe", "Biscoito"]

    init(contentView: some ListOfAnimalsViewProtocol = ListOfAnimalsView(),
         viewModel: ListOfAnimalsViewModel) {
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
        contentView.tableAnimal.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        contentView.tableAnimal.delegate = self
        contentView.tableAnimal.dataSource = self
        mycloud.filterRecords(recordType: .animal, dataBase: mycloud.publishContainer)
        mycloud.cache.bind { value in
            DispatchQueue.main.async {
                if value != nil {
                    guard let value else {return}
                    self.teste = value.map { $0.value(forKey: "nameAnimal") as! String}
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
