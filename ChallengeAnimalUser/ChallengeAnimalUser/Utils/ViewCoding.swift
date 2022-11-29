//
//  ViewCoding.swift
//  ChallengeAnimalUser
//
//  Created by Joan Wilson Oliveira on 29/11/22.
//

import Foundation

protocol ViewCoding {
    func setupView()
    func setupHierarchy()
    func setupConstraints()
}

extension ViewCoding {
    func buildLayout() {
        setupView()
        setupHierarchy()
        setupConstraints()
    }
}
