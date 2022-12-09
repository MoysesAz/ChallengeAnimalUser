//
//  MyCloud.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 28/11/22.
//

import CloudKit

protocol ICloudRepositoryProtocol {
    var cacheRecords: ObservableObject<[CKRecord]?> { get }
    var publishContainer: CKDatabase { get }
    func filterRecords(recordType: RecordsNamesEnum,
                       dataBase: CKDatabase)
    func filterRecords(recordType: RecordsNamesEnum,
                       dataBase: CKDatabase,
                       filter: NSPredicate)
    func fetch(recordType: RecordsNamesEnum,
               dataBase: CKDatabase) async  throws -> [CKRecord]

}

final class ICloudRepository: ICloudRepositoryProtocol {

    var cacheRecords: ObservableObject<[CKRecord]?> = ObservableObject(nil)
    //    cache tem que ser um modelo que receba todos os dados $0.0, record
    let publishContainer: CKDatabase

    //    CKContainer(identifier: "iCloud.Mirazev.AnimalUser").publicCloudDatabase

    init(publishContainer: CKDatabase) {
        self.publishContainer = publishContainer
    }

    public func filterRecords(recordType: RecordsNamesEnum,
                              dataBase: CKDatabase) {
        let filter = NSPredicate(value: true)
        self.filterRecords(recordType: recordType, dataBase: dataBase, filter: filter)
    }

    public func filterRecords(recordType: RecordsNamesEnum,
                              dataBase: CKDatabase,
                              filter: NSPredicate = NSPredicate(value: true)) {
        var records: [CKRecord] = []
        let query = CKQuery(recordType: recordType.rawValue, predicate: filter)
        // let results = try await dataBase.records(matching: query)
        // let records = try results.matchResults.compactMap({ try? $0.1.get() })
        dataBase.fetch(withQuery: query) { response in
            switch response {
            case .success(let value):
                _ = value.matchResults.map {
                    switch $0.1 {
                    case .success(let record):
                        records.append(record)
                    case .failure(let error):
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
            self.cacheRecords.value?.removeAll()
            self.cacheRecords.value = records
            // Hipotese Python quando um map era feito ele nao era carregado ate que fosse transformado em uma lista
            // Observei que quando uma instancia e usada nesse processo ela nao e carregada, Entretando
            // Eu usei um for para confirmar e houve o mesmo problema, acredito ter relacao com o .sucess
        }
    }

    func fetch(recordType: RecordsNamesEnum, dataBase: CKDatabase) async throws -> [CKRecord] {
        let filter: NSPredicate = NSPredicate(value: true)
        let records = try await  self.fetch(recordType: recordType, dataBase: dataBase, filter: filter)
        return records
    }

    public func fetch(recordType: RecordsNamesEnum,
                      dataBase: CKDatabase,
                      filter: NSPredicate = NSPredicate(value: true)) async throws -> [CKRecord] {

        let query = CKQuery(recordType: recordType.rawValue, predicate: filter)
        do {
            let results = try await dataBase.records(matching: query)
            let records = results.matchResults.compactMap({ try? $0.1.get() })
            return records
        } catch {
            print(error)
            return []
        }
    }
}
