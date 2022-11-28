//
//  ListOfShelters.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 27/11/22.
//

import Foundation
import UIKit

protocol AutoViewConstraints {}

class ListOfSheltersView: UIView {
    lazy var tableShelters: UITableView = {
        let tableShelters = UITableView()
        tableShelters.translatesAutoresizingMaskIntoConstraints = false
        return tableShelters
    }()

    override func willMove(toWindow newWindow: UIWindow?) {
        addSubview(tableShelters)
        setConstraint()
    }
}

extension ListOfSheltersView {
    func setConstraint() {
        tableSheltersConstraints()
    }

    func tableSheltersConstraints() {
        NSLayoutConstraint.activate([
            tableShelters.heightAnchor.constraint(equalTo: heightAnchor),
            tableShelters.widthAnchor.constraint(equalTo: widthAnchor),
            tableShelters.centerYAnchor.constraint(equalTo: centerYAnchor),
            tableShelters.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

}

extension ListOfSheltersView: SheltersViewProtocol {}
