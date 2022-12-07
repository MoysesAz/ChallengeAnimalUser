//
//  ShelterModelView.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 27/11/22.
//

import Foundation
import CloudKit

class ShelterViewModel {
    var cloudRepository: ICloudRepositoryProtocol

    var cacheRecores: ObservableObject<[CKRecord]?> = ObservableObject(nil)

    init(cloudRepository: ICloudRepositoryProtocol) {
        self.cloudRepository = cloudRepository
    }

    public func fetchRecords() {

    }



}
