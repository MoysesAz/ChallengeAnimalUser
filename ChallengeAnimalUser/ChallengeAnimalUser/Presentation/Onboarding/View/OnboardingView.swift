//
//  OnboardingView.swift
//  ChallengeAnimalUser
//
//  Created by Joan Wilson Oliveira on 02/12/22.
//

import UIKit
import AuthenticationServices

protocol OnboardingViewDelegate: AnyObject {
    func handleLogInWithAppleId()
}

class OnboardingView: UIView {

    weak var delegate: OnboardingViewDelegate?

    lazy var appleLogInButton: ASAuthorizationAppleIDButton = {
        let button = ASAuthorizationAppleIDButton()
        button.addTarget(self, action: #selector(handleLogInWithAppleID), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        buildLayout()
    }

    @objc func handleLogInWithAppleID() {
        delegate?.handleLogInWithAppleId()
    }
}

extension OnboardingView: ViewCoding {
    func setupView() {
        self.backgroundColor = .white
    }

    func setupHierarchy() {
        self.addSubview(appleLogInButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            appleLogInButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: frame.height * -0.1),
            appleLogInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            appleLogInButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            appleLogInButton.heightAnchor.constraint(equalToConstant: 40 )
        ])
    }
}
