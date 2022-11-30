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
    var cache1: [CKRecord] = []
//    cache tem que ser um modelo que receba todos os dados $0.0, record
    let publishContainer = CKContainer(identifier: "iCloud.Mirazev.AnimalUser").publicCloudDatabase

    func filterRecords(recordType: RecordsNamesEnum, dataBase: CKDatabase, filter: String = "") {
        var predicate = NSPredicate(value: true)
        if filter != "" { predicate = NSPredicate(format: filter)}
        let query = CKQuery(recordType: recordType.rawValue, predicate: predicate)
        // let results = try await dataBase.records(matching: query)
        // let records = try results.matchResults.compactMap({ try? $0.1.get() })

        dataBase.fetch(withQuery: query) { response in
            switch response {
            case .success(let value):
                _ = value.matchResults.map {
                    switch $0.1 {
                    case .success(let record):
                        self.cache1.append(record)
                    case .failure(let error):
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
            self.cache.value = self.cache1
            // Hipotese Python quando um map era feito ele nao era carregado ate que fosse transformado em uma lista
            // Observei que quando uma instancia e usada nesse processo ela nao e carregada, Entretando
            // Eu usei um for para confirmar e houve o mesmo problema, acredito ter relacao com o .sucess
        }

    }
}
