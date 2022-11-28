//
//  MyCloud.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 28/11/22.
//

import Foundation
import CloudKit

class MyCloud {
    var cache: ObservableObject<[CKRecord]?> = ObservableObject(nil)
//    cache tem que ser um modelo que receba todos os dados $0.0, record
    let publishContainer = CKContainer(identifier: "iCloud.Mirazev.AnimalUser").publicCloudDatabase

    func filterRecords(recordType: RecordsNamesEnum, dataBase: CKDatabase, filter: String = "") {
        var predicate = NSPredicate(value: true)
        if filter != "" { predicate = NSPredicate(format: filter)}

        let query = CKQuery(recordType: recordType.rawValue, predicate: predicate)
        dataBase.fetch(withQuery: query) { records in
            switch records {
            case .success(let value):
            var _ = value.matchResults.map({
                    switch $0.1 {
                    case .success(let record):
                        self.cache.value?.append(record)
                    case .failure(let error):
                        print(error)
                    }
                })
            case .failure(let error):
                print(error)
            }
        }
    }
}
