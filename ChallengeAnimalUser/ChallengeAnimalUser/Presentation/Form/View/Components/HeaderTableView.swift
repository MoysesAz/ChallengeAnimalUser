//
//  HeaderTableView.swift
//  ChallengeAnimalUser
//
//  Created by Robson Lima Lopes on 01/12/22.
//  swiftlint:disable: line_length

import UIKit

class HeaderFormTableView: UIView {

    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var topic: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.numberOfLines = .max
        label.text = "Topic"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var topicDescription: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = .max
        label.lineBreakMode = .byWordWrapping
        label.text = "Textinho qualquer"
        label.font = UIFont.preferredFont(forTextStyle: .body)
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

    func configure(form: FormEnum) {
        switch form {
        case .rgData:
            self.topic.text = "Parte 1 de 5"
            self.topicDescription.text = "Primeiro, tire uma foto da frente e uma foto do verso de um documento de identidade válido e com foto, como o seu RG ou CNH."

        case .residenceProof:
            self.topic.text = "Parte 2 de 5"
            self.topicDescription.text = "Agora tire uma foto de uma conta recente que comprove a sua residência. Pode ser a sua conta de luz, de água ou uma fatura na qual apareça o seu nome e endereço."

        case .petLocal:
            self.topic.text = "Parte 3 de 5"
            self.topicDescription.text = "Agora tire uma foto do local aonde o cachorro irá ficar mostrando os arredores. Pode ser a sua conta de luz, de água ou uma fatura na qual apareçam o seu nome e endereço."

        case .userContact:
            self.topic.text = "Parte 4 de 5"
            self.topicDescription.text = "Esse é o texto para as informações de contato do usuário"
        case .textToONG:
            self.topic.text = "Parte 5 de 5"
            self.topicDescription.text = "Esse é o texto para informar que o usuário pode digitar o que quiser para os abrigos"
        }
    }
}

extension HeaderFormTableView: ViewCodingProtocol {
    func setupView() {
        self.backgroundColor = .clear
    }

    func setupHierarchy() {
        stack.addArrangedSubview(topic)
        stack.addArrangedSubview(topicDescription)
        self.addSubview(stack)
    }

    func setupConstraints() {
        topicConstraints()
        topicDescriptionConstraints()
        stackConstraints()
    }
}

extension HeaderFormTableView {
    private func topicConstraints() {
        NSLayoutConstraint.activate([
            topic.widthAnchor.constraint(
                equalTo: self.widthAnchor
            )
        ])
    }

    private func topicDescriptionConstraints() {
        NSLayoutConstraint.activate([
            topicDescription.widthAnchor.constraint(
                equalTo: self.widthAnchor
            )
        ])
    }

    private func stackConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: 15
            ),
            stack.bottomAnchor.constraint(
                equalTo: self.bottomAnchor,
                constant: -15
            ),
            stack.widthAnchor.constraint(
                equalTo: self.widthAnchor
            )
        ])
    }
}
