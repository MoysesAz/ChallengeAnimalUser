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
    var teste = ["Moyses", "teste", "BRUTUS"]

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
        contentView.tableShelters.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        contentView.tableShelters.delegate = self
        contentView.tableShelters.dataSource = self
        mycloud.filterRecords(recordType: .shelter, dataBase: mycloud.publishContainer)
        }
    }

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teste.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contentView.tableShelters.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = teste[indexPath.row]
        return cell
    }
}
