//
//  ViewController.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 25/11/22.
//

import UIKit

class ViewController: UIViewController {
    var viewModel: SheltersViewModel
    var contentView: SheltersViewProtocol
    var mycloud = MyCloud()
    var teste = ["São Lazaro", "Abrigo dos Gatos"]

    init(contentView: some SheltersViewProtocol = ListOfSheltersView(),
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
        contentView.tableShelters.register(ShelterTableViewCell.self, forCellReuseIdentifier: ShelterTableViewCell.identifier)
        contentView.tableShelters.delegate = self
        contentView.tableShelters.dataSource = self
        mycloud.filterRecords(recordType: .shelter, dataBase: mycloud.publishContainer)
        mycloud.cache.bind { value in
            DispatchQueue.main.async {
                if value != nil {
                    guard let value else {return}
                    print(value)
                    self.teste = value.map { $0.recordType }
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = ListOfAnimalsViewModel(animalID: indexPath.row)
        let controller = ListOfAnimalsController(viewModel: viewModel)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teste.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ShelterTableViewCell.identifier,
            for: indexPath
        ) as? ShelterTableViewCell else {
            return UITableViewCell()
        }


        return cell
    }
}
