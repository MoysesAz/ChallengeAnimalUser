//
//  ListOfAnimalsView.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 28/11/22.
//
import UIKit

protocol PetViewProtocol: UIView {
    var tableAnimal: UITableView { get }
    var indicator: UIActivityIndicatorView { get }
    func configure()
    func loadData()
}

final class PetView: UIView {
    lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        return indicator
    }()

    lazy var tableAnimal: UITableView = {
        let tableAnimal = UITableView(frame: .zero, style: .plain)
        tableAnimal.register(PetTableViewCell.self, forCellReuseIdentifier: PetTableViewCell.identifier)
        tableAnimal.translatesAutoresizingMaskIntoConstraints = false
        return tableAnimal
    }()

    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        buildLayout()
    }
}

extension PetView: PetViewProtocol {
    func loadData() {
        indicator.isHidden = false
        tableAnimal.isHidden = true
    }

    func configure() {
        indicator.isHidden = true
        tableAnimal.isHidden = false
    }
}

extension PetView: ViewCodingProtocol {
    func setupView() {
        backgroundColor = .systemBackground
    }

    func setupHierarchy() {
        add(subviews: tableAnimal, indicator)
    }

    func setupConstraints() {
        indicatorConstraints()
        tableAnimalConstraints()
    }

}

extension PetView {
    private func indicatorConstraints() {
        NSLayoutConstraint.activate([
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    private func tableAnimalConstraints() {
        NSLayoutConstraint.activate([
            tableAnimal.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableAnimal.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableAnimal.topAnchor.constraint(equalTo: self.topAnchor),
            tableAnimal.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
