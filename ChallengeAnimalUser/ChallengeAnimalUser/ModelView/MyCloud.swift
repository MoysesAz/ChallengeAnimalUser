//
//  MyCloud.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 28/11/22.
//

import Foundation
import CloudKit

class MyCloud {
    var cache: [String] = []
//    cache tem que ser um modelo que receba todos os dados $0.0, record
    let publishContainer = CKContainer(identifier: "iCloud.Mirazev.AnimalUser").publicCloudDatabase

    func filterRecords(recordType: RecordsNamesEnum, dataBase: CKDatabase) {
        let test = NSPredicate(value: true)
        let query = CKQuery(recordType: recordType.rawValue, predicate: test )
        dataBase.fetch(withQuery: query) { records in
            switch records {
            case .success(let value):
                var _ = value.matchResults.map({
                    switch $0.1 {
                    case .success(let record):
                        //Criar decoder do valor e armazenar no cache
                        print($0.0)
                        print(record)
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
