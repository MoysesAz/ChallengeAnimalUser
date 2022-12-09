//
//  ViewController.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 25/11/22.
//

import UIKit
import CloudKit

final class ShelterViewController: UIViewController {
    private var viewModel: ShelterViewModel
    private var contentView: SheltersViewProtocol
    private var isSearch: Bool = false
    private var searchController: UISearchController = UISearchController(searchResultsController: nil)

    init(contentView: some SheltersViewProtocol = ShelterView(),
         viewModel: ShelterViewModel) {
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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addBinders()
        Task {
            await viewModel.fetchShelterRecordsFromRepository()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Abrigos"
        navigationItem.backBarButtonItem = backItem
    }

    private func addBinders() {
        viewModel.cacheRecords.bind { value in
            DispatchQueue.main.async {
                if value != nil {
                    guard let value else { return }
                    print(value)
                    self.viewModel.records = value.map { $0 }
                    self.viewModel.searchRecord = self.viewModel.records
                    self.contentView.tableShelters.reloadData()
                    self.contentView.configure()
                }
            }
        }
    }

    private func configNavigationBar() {
        title = "Abrigos próximos"
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchBar.delegate = self
        navigationItem.searchController = self.searchController
    }

    private func configTable() {
        contentView.tableShelters.register(
            ShelterTableViewCell.self,
            forCellReuseIdentifier: ShelterTableViewCell.identifier
        )
        contentView.tableShelters.delegate = self
        contentView.tableShelters.dataSource = self
    }

    private func configViewController() {
        configNavigationBar()
        configTable()
    }
}

extension ShelterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = viewModel.setDidSelectRow(tableView, didSelectRowAt: indexPath)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension ShelterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchRecord.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.makeShelterCell(tableView, cellForRowAt: indexPath)
    }
}

extension ShelterViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.configSearchBar(searchBar, textDidChange: searchText)
        contentView.tableShelters.reloadData()
    }
}
