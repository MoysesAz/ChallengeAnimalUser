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
        stack.alignment = .leading
        stack.spacing = 10
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var topic: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = .max
        label.text = "Topic"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private var topicDescription: UILabel = {
        let text = UILabel()
        text.textAlignment = .left
        text.lineBreakMode = .byWordWrapping
        text.numberOfLines = .max
        text.layer.cornerRadius = 5
        text.text = "Textinho qualquer"
        text.font = UIFont.preferredFont(forTextStyle: .body)
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
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
            self.topic.text = "RG ou CNH"
            self.topicDescription.text = "Primeiro, tire uma foto da frente e uma foto do verso de um documento de identidade válido e com foto, como o seu RG ou CNH."

        case .residenceProof:
            self.topic.text = "Comprovante de Residência"
            self.topicDescription.text = "Agora tire uma foto de uma conta recente que comprove a sua residência. Pode ser a sua conta de luz, de água ou uma fatura na qual apareça o seu nome e endereço."

        case .petLocal:
            self.topic.text = "Moradia do animal"
            self.topicDescription.text = "Agora tire uma foto do local aonde o cachorro irá ficar mostrando os arredores. Pode ser a sua conta de luz, de água ou uma fatura na qual apareçam o seu nome e endereço."

        case .userContact:
            self.topic.text = "Dados de Contato"
            self.topicDescription.text = "Esse é o texto para as informações de contato do usuário"
        case .textToONG:
            self.topic.text = "Mensagem para abirgo"
            self.topicDescription.text = "Esse é o texto para informar que o usuário pode digitar o que quiser para os abrigos"
        }
    }
}

extension HeaderFormTableView: ViewCoding {
    func setupView() {
//        stack.layer.borderWidth = 1
//        stack.layer.borderColor = UIColor.red.cgColor
        self.backgroundColor = .clear
    }

    func setupHierarchy() {
        stack.addArrangedSubview(topic)
        stack.addArrangedSubview(topicDescription)
        self.addSubview(stack)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            topicDescription.widthAnchor.constraint(
                equalTo: self.widthAnchor
            ),
            stack.widthAnchor.constraint(
                equalTo: self.widthAnchor
            ),
            stack.centerXAnchor.constraint(
                equalTo: self.centerXAnchor
            ),
            stack.heightAnchor.constraint(
                greaterThanOrEqualToConstant: 200
            ),
            stack.topAnchor.constraint(
                equalTo: self.topAnchor
            ),
            stack.bottomAnchor.constraint(
                equalTo: self.bottomAnchor,
                constant: -20
            )
        ])
    }
}
