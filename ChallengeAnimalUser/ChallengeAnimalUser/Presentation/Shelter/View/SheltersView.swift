//
//  ListOfShelters.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 27/11/22.
//

import Foundation
import UIKit

protocol SheltersViewProtocol: UIView {
    var tableShelters: UITableView { get }
    func loadData()
    func configure()
}

class ShelterView: UIView {
    lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        return indicator
    }()

    lazy var tableShelters: UITableView = {
        let tableShelters = UITableView()
        tableShelters.translatesAutoresizingMaskIntoConstraints = false
        return tableShelters
    }()

    override func willMove(toWindow newWindow: UIWindow?) {
        setupView()
    }
}

extension ShelterView: SheltersViewProtocol {
    func loadData() {
        indicator.isHidden = false
        tableShelters.isHidden = true
    }

    func configure() {
        indicator.isHidden = true
        tableShelters.isHidden = false
    }
}

extension ShelterView: ViewCodingProtocol {
    func setupView() {
        backgroundColor = .systemBackground
        setupHierarchy()
        setupConstraints()
    }

    func setupHierarchy() {
        addSubview(tableShelters)
        addSubview(indicator)
    }
    
    func setupConstraints() {
        indicatorConstraints()
        tableSheltersConstraints()
    }
}

extension ShelterView {
    

    private func indicatorConstraints() {
        NSLayoutConstraint.activate([
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
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
