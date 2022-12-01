//
//  HeaderTableView.swift
//  ChallengeAnimalUser
//
//  Created by Robson Lima Lopes on 01/12/22.
//

import UIKit

class HeaderFormTableView: UIView {

    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = .max
        label.text = "Textinho qualquer"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(form: Form) {
        switch form {
        case .rgData:
            self.label.text = "Esse é o texto para o RG"
        case .residenceProof:
            self.label.text = "Esse é o texto para as informações de local de residência"
        case .petLocal:
            self.label.text = "Esse é o texto para as informações de local onde o pet vai ficar"
        case .userContact:
            self.label.text = "Esse é o texto para as informações de contato do usuário"
        case .textToONG:
            self.label.text = "Esse é o texto para informar que o usuário pode digitar o que quiser para os abrigos"
        }
    }

}

extension HeaderFormTableView: ViewCoding {
    func setupView() {
        self.backgroundColor = .clear
    }

    func setupHierarchy() {
        self.addSubview(label)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(
                equalTo: self.heightAnchor
            ),
            label.widthAnchor.constraint(
                equalTo: self.widthAnchor,
                multiplier: 0.9
            ),
            label.centerXAnchor.constraint(
                equalTo: self.centerXAnchor
            )
        ])
    }


}
