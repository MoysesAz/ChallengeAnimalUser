//
//  AnimalModel.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 28/11/22.
//

import Foundation
import CloudKit

class PetViewModel {
    let shelterId: CKRecord.Reference
    let titleView: String

    init(shelterId: CKRecord.Reference, titleView: String) {
        self.shelterId = shelterId
        self.titleView = titleView
    }

}
