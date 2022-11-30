//
//  ListOfAnimalsView.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 28/11/22.
//
import UIKit

protocol PetViewProtocol: UIView {
    var tableAnimal: UITableView { get }
    func configure()
    func loadData()

}
class PetView: UIView {
    lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        return indicator
    }()

    lazy var tableAnimal: UITableView = {
        let tableAnimal = UITableView()
        tableAnimal.translatesAutoresizingMaskIntoConstraints = false
        return tableAnimal
    }()

    override func willMove(toWindow newWindow: UIWindow?) {
        backgroundColor = .white
        addSubview(indicator)
        addSubview(tableAnimal)
        setConstraint()
    }
}

extension PetView {
    func setConstraint() {
        indicatorConstraints()
        tableAnimalConstraints()
    }
    private func indicatorConstraints() {
        NSLayoutConstraint.activate([
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
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

extension PetView: PetViewProtocol {
    func loadData() {
        tableAnimal.isHidden = true
        indicator.isHidden = false
    }

    func configure() {
        tableAnimal.isHidden = false
        indicator.isHidden = true
    }

}
