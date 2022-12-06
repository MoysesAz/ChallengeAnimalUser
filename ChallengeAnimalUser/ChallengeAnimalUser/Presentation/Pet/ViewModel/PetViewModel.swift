//
//  AnimalModel.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 28/11/22.
//

import UIKit
import CloudKit

class PetViewModel {
    let shelterId: CKRecord.Reference
    let titleView: String

    init(shelterId: CKRecord.Reference, titleView: String) {
        self.shelterId = shelterId
        self.titleView = titleView
    }

    public func makeCell(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath,
        records: [CKRecord]
    ) -> UITableViewCell? {

        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: PetTableViewCell.identifier,
                for: indexPath
            ) as? PetTableViewCell,
            let image: CKAsset = records[indexPath.row].object(forKey: "image") as? CKAsset,
            let neutered = records[indexPath.row].value(forKey: "neutered") as? String,
            let name = records[indexPath.row].value(forKey: "nameAnimal") as? String else {
            return nil
        }

        let isNeureted = neutered == "true" ? true : false

        let imageURL: URL? = URL(string: image.fileURL!.absoluteString)
        let cellInfo = PetModel(name: name, image: imageURL, age: 10, isNeutered: isNeureted)

        cell.petInfo = cellInfo

        return cell
    }

}
