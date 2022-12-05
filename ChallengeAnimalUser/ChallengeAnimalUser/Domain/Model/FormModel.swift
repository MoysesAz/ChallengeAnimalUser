//
//  FormModel.swift
//  ChallengeAnimalUser
//
//  Created by Robson Lima Lopes on 01/12/22.
//

import UIKit

class FormModel {
    var frontRG: UIImage?
    var backRG: UIImage?
    var residenceProof: UIImage?
    var petSpace: UIImage?
    var email: String?
    var phone: String?
    var text: String?

    static var instance = FormModel()

    func resetAll() {
        FormModel.instance = FormModel()
    }

    private init() {}
}
