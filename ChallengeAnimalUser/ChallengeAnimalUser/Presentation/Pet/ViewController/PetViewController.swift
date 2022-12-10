//
//  AnimalsController.swift
//  ChallengeAnimalUser
//  Created by Moyses Miranda do Vale Azevedo on 28/11/22.
//

import UIKit
import CloudKit

final class PetViewController: UIViewController {
    private var viewModel: PetViewModel
    private var contentView: PetViewProtocol
    private var isSearch: Bool = false
    private var searchController: UISearchController = UISearchController(searchResultsController: nil)

    init(contentView: some PetViewProtocol = PetView(),
         viewModel: PetViewModel) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configViewController()

//        contentView.loadData()
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addBinders()
        Task {
            await viewModel.fetchPetsRecordsFromRepository()
        }
    }

    private func addBinders() {
        cacheRecordsBinder()
    }

    private func configNavigationBar() {
        title = viewModel.titleView
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchBar.delegate = self
        navigationItem.searchController = self.searchController
        navigationItem.backButtonTitle = "Abrigos"
        createFilterNavigationItem()
    }

    private func configTable() {
        contentView.tableAnimal.register(
            PetTableViewCell.self,
            forCellReuseIdentifier: PetTableViewCell.identifier
        )
        contentView.tableAnimal.delegate = self
        contentView.tableAnimal.dataSource = self
    }

    private func configViewController() {
        configNavigationBar()
        configTable()
    }

    private func createFilterNavigationItem() {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "line.3.horizontal.decrease"), for: .normal)
        button.addTarget(self, action: #selector(filterAnimals), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }

    @objc func filterAnimals() {
        print("Helo")
    }
}

extension PetViewController {
    private func cacheRecordsBinder() {
        viewModel.cacheRecords.bind { value in
            DispatchQueue.main.async {
                if value != nil {
                    guard let value else { return }
                    print(value)
                    self.viewModel.records = value.map { $0 }
                    self.viewModel.searchRecord = self.viewModel.records
                    self.contentView.tableAnimal.reloadData()
                    self.contentView.configure()
                }
            }

        }
    }
}

extension PetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = FormOnboardingViewController()
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
