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
            return "RG ou CNH"
        case .residenceProof:
            return "Comprovante de Residência"
        case .petLocal:
            return "Moradia do animal"
        case .userContact:
            return "Dados de Contato"
        case .textToONG:
            return "Mensagem para abrigo"
        }
    }

    func cleanData() {
        FormModel.instance.resetAll()
    }

    func getImageFromModel(form: Form, buttonTag: Int) -> UIImage? {
        switch form {
        case .rgData:
            switch buttonTag {
            case 0:
                return FormModel.instance.frontRG
            case 1:
                return FormModel.instance.backRG
            default:
                fatalError("TableViewTag does not match any part of RGData")
            }

        case .residenceProof:
            if buttonTag == 0 {
                return FormModel.instance.residenceProof
            } else {
                fatalError("TableViewTag does not match any part of residence proof")
            }
        case .petLocal:
            if buttonTag == 0 {
                return FormModel.instance.petSpace
            } else {
                fatalError("TableViewTag does not match any part of pet space")
            }
        default:
            fatalError("Form has no correspondent with image requisition")
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
        default:
            fatalError("Form has no correspondent with image requisition")
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
        if tableViewTag == 0 {
            FormModel.instance.residenceProof = image
        } else {
            fatalError("TableViewTag != 0")
        }
    }

    private func savePetLocalData(image: UIImage, tableViewTag: Int) {
        if tableViewTag == 0 {
            FormModel.instance.petSpace = image
        } else {
            fatalError("TableViewTag != 0")
        }
    }
}
