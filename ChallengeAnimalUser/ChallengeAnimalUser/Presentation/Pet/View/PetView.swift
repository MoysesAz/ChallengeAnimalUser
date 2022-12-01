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
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
//        indicator.startAnimating()
        return indicator
    }()

    lazy var tableAnimal: UITableView = {
        let tableAnimal = UITableView(frame: .zero, style: .grouped)
        tableAnimal.translatesAutoresizingMaskIntoConstraints = false
        return tableAnimal
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(indicator)
        addSubview(tableAnimal)
        setConstraint()
    }

    override func willMove(toWindow newWindow: UIWindow?) {

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
        tableAnimal.isHidden = false
        indicator.isHidden = false
    }

    func configure() {
        tableAnimal.isHidden = false
        indicator.isHidden = false
    }

}
