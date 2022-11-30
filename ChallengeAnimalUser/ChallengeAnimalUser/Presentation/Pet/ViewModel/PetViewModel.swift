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

    init(shelterId: CKRecord.Reference) {
       self.shelterId = shelterId
   }

}
