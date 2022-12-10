//
//  ShelterModelView.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 27/11/22.
//

import UIKit
import CloudKit

final class ShelterViewModel {
    private var cloudRepository: ICloudRepositoryProtocol
    var cacheRecords: ObservableObject<[CKRecord]?> = ObservableObject(nil)
    var records: [CKRecord] = []
    var searchRecord: [CKRecord] = []
    var tableViewAutoDimension: CGFloat

    init(cloudRepository: some ICloudRepositoryProtocol) {
        self.cloudRepository = cloudRepository
        self.tableViewAutoDimension = UITableView.automaticDimension

    }

    public func fetchShelterRecordsFromRepository() async {
        let database = CKContainer(identifier: "iCloud.Mirazev.AnimalUser").publicCloudDatabase
        do {
            let shelters = try await cloudRepository.fetch(
                recordType: .shelter,
                dataBase: database
            )
            cacheRecords.value = shelters
            print(shelters)
        } catch {
            print(error.localizedDescription)
        }
    }

    public func makeShelterCell(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ShelterTableViewCell.identifier,
            for: indexPath
        ) as? ShelterTableViewCell else {
            return UITableViewCell()
        }

        let shelter = searchRecord[indexPath.row]

        guard
            let name = shelter.value(forKey: "shelterName") as? String,
            let image: CKAsset = shelter.object(forKey: "logo") as? CKAsset else {
            return UITableViewCell()
        }
        let imageURL: URL? = URL(string: image.fileURL!.absoluteString)
        let cellInfo = Shelter(name: name, image: imageURL)
        cell.shelterInfo = cellInfo
        return cell
    }

    public func configSearchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            guard let value =  cacheRecords.value else {return}
            searchRecord = value
        } else {
            searchRecord = records.filter({
                guard let value = $0.value(forKey: "shelterName") else { return false }
                guard let name = value as? String else { return false }
                return name.lowercased().stripingDiacritics.contains(searchText.lowercased().stripingDiacritics)
            })
        }
    }

    public func setDidSelectRow(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> UIViewController {
        let id = records[indexPath.row].recordID
        guard let title = records[indexPath.row].value(forKey: "shelterName") as? String else {
            return UIViewController()
        }
        let reference = CKRecord.Reference(recordID: id, action: .none)
        let repository = CKContainer(identifier: "iCloud.Mirazev.AnimalUser").publicCloudDatabase
        let cloudRepository = ICloudRepository(publishContainer: repository)
        let viewModel = PetViewModel(shelterId: reference, titleView: title, cloudRepository: cloudRepository)
        let controller = PetViewController(viewModel: viewModel)
        return controller
    }

    public func moveToShelterDetailPetsView(_ tableView: UITableView,
                                            didSelectRowAt indexPath: IndexPath,
                                            navBarController: UINavigationController?) {
        let controller = setDidSelectRow(tableView, didSelectRowAt: indexPath)
         navBarController?.pushViewController(controller, animated: true)
    }
}
