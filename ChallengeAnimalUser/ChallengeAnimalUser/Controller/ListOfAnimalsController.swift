//
//  AnimalsController.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 28/11/22.
//

import UIKit

class AnimalsController: UIViewController {
    var viewModel: AnimalViewModel
    var contentView: AnimalsViewProtocol
    var mycloud = MyCloud()
    var teste = ["Moyses", "teste", "BRUTUS"]

    init(contentView: some AnimalsViewProtocol = ListOfAnimalsView(),
         viewModel: SheltersViewModel = SheltersViewModel()) {
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
        contentView.tableShelters.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        contentView.tableShelters.delegate = self
        contentView.tableShelters.dataSource = self
        mycloud.filterRecords(recordType: .shelter, dataBase: mycloud.publishContainer)
        mycloud.cache.bind{ value in
            DispatchQueue.main.async {
                if value != nil {
                    print(value)
                }
            }
        }
    }
}

extension AnimalsController: UITableViewDelegate {}

extension AnimalsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teste.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contentView.tableShelters.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = teste[indexPath.row]
        return cell
    }
}
