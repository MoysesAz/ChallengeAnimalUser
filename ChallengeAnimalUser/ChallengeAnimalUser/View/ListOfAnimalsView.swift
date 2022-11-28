//
//  ListOfAnimalsView.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 28/11/22.
//

import Foundation
import UIKit

class ListOfAnimalsView: UIView {
    lazy var tableAnimal: UITableView = {
        let tableAnimal = UITableView()
        tableAnimal.translatesAutoresizingMaskIntoConstraints = false
        return tableAnimal
    }()

    override func willMove(toWindow newWindow: UIWindow?) {
        addSubview(tableAnimal)
        setConstraint()
    }
}

extension ListOfAnimalsView {
    func setConstraint() {
        tableAnimalConstraints()
    }

    func tableAnimalConstraints() {
        NSLayoutConstraint.activate([
            tableAnimal.heightAnchor.constraint(equalTo: heightAnchor),
            tableAnimal.widthAnchor.constraint(equalTo: widthAnchor),
            tableAnimal.centerYAnchor.constraint(equalTo: centerYAnchor),
            tableAnimal.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

}

extension ListOfAnimalsView: ListOfAnimalsViewProtocol {
}
