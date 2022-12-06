//
//  ListOfAnimalsView.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 28/11/22.
//
import UIKit

protocol PetViewProtocol {
    var tableAnimal: UITableView { get }
    func configure()
    func loadData()
}

final class PetView: UIView {
    lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
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

    override init(frame: CGRect) {
        super.init(frame: .zero)
        buildLayout()
        configure()
    }

    required init?(coder: NSCoder) {
        return nil
    }
}

extension PetView: ViewCodingProtocol {
    func setupView() {
        //Quebrando SOLID
    }

    func setupHierarchy() {
        self.add(subviews: tableAnimal, indicator)
    }

    func setupConstraints() {
        indicatorConstraints()
        tableAnimalConstraints()
    }

}

// MARK: - Constraints
extension PetView {
    private func indicatorConstraints() {
        NSLayoutConstraint.activate([
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func tableAnimalConstraints() {
        NSLayoutConstraint.activate([
            tableAnimal.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableAnimal.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableAnimal.topAnchor.constraint(equalTo: self.topAnchor),
            tableAnimal.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension PetView: PetViewProtocol {
    func loadData() {
        indicator.isHidden = false
    }

    func configure() {
        indicator.isHidden = true
    }
}
