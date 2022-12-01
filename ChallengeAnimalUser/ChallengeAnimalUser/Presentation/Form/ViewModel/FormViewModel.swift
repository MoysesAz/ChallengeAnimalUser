//
//  FormViewModel.swift
//  ChallengeAnimalUser
//
//  Created by Robson Lima Lopes on 01/12/22.
//

import UIKit

class FormViewModel {

    init() {}

    func setTitle(form: Form) -> String {
        switch form {
        case .rgData:
            return "Título do RG"
        case .residenceProof:
            return "Título dda residência"
        case .petLocal:
            return "Tíyulo local do pet"
        case .userContact:
            return "título dados do usuário"
        case .textToONG:
            return "título do texto da ONG"
        }
    }

    func saveImage(
        image: UIImage,
        tableViewTag: Int,
        form: Form
    ) {
        switch form {
        case .rgData:
            saveRGData(
                image: image,
                tableViewTag: tableViewTag
            )
        case .residenceProof:
            saveResidenceProofData(
                image: image,
                tableViewTag: tableViewTag
            )
        case .petLocal:
            savePetLocalData(
                image: image, tableViewTag: tableViewTag
            )
        case .userContact:
            fatalError("User Contact Data required by ImagesFormTableViewController to save in model")
        case .textToONG:
            fatalError("Text to ONG required by ImagesFormTableViewController to save in model")
        }
    }

    private func saveRGData(
        image: UIImage,
        tableViewTag: Int
    ) {
        switch tableViewTag {
        case 0:
            FormModel.instance.frontRG = image
        case 1:
            FormModel.instance.backRG = image
        default:
            fatalError("TableViewTag does not match any part of RGData")
        }
    }

    private func saveResidenceProofData(
        image: UIImage,
        tableViewTag: Int
    ) {
        if (tableViewTag == 0){
            FormModel.instance.residenceProof = image
        } else {
            fatalError("TableViewTag != 0")
        }
    }

    private func savePetLocalData(image: UIImage, tableViewTag: Int) {
        if (tableViewTag == 0){
            FormModel.instance.petSpace = image
        } else {
            fatalError("TableViewTag != 0")
        }
    }
}
