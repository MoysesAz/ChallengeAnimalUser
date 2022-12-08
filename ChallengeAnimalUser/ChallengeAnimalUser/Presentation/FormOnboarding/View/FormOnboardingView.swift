//
//  FormOnboardingView.swift
//  ChallengeAnimalUser
//
//  Created by Pedro Muniz on 06/12/22 🖖
//

import UIKit

class FormOnboardingView: UIView {
    // ℹ️ All individual elements on this screen are declared below
    let girlAndDogImage = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "girlAndDogImage")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let formsIntro = {
        let formsIntro = UILabel()
        formsIntro.text = "Pessoas acima de 21 anos podem fazer um cadastro para solicitar a adoção de um animal. Separe os seguintes documentos:"
        formsIntro.lineBreakMode = .byWordWrapping
        formsIntro.numberOfLines = .max
        formsIntro.translatesAutoresizingMaskIntoConstraints = false
        return formsIntro
    }()
    lazy var documentsListStack = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 6.0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var idStack = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.addArrangedSubview(idIcon)
        stackView.addArrangedSubview(idIconLabel)
        return stackView
    }()
    lazy var homeStack = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.addArrangedSubview(homeIcon)
        stackView.addArrangedSubview(homeIconLabel)
        return stackView
    }()
    lazy var photoStack = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.addArrangedSubview(photoIcon)
        stackView.addArrangedSubview(photoIconLabel)
        return stackView
    }()
    let idIcon = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "idIcon")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let homeIcon = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "homeIcon")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let photoIcon = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "photoIcon")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let idIconLabel = {
        let label = UILabel()
        label.text = "RG ou CNH"
        return label
    }()
    let homeIconLabel = {
        let label = UILabel()
        label.text = "Comprovante de residência"
        return label
    }()
    let photoIconLabel = {
        let label = UILabel()
        label.text = "Foto do local onde o animal vai morar"
        return label
    }()
    let securityIcon = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "securityIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let securityInfo = {
        let label = UILabel()
//        let textLink = " Clique aqui para saber mais." // ⚠️ Still need to add a blue color to this string and make it into a link.
//        let attributedQuote = NSAttributedString(string: quote, attributes: attributes)
        label.text = "Respeitamos sua privacidade. Seus dados serão compartilhados apenas com o abrigo responsável." // + textLink ⚠️ Uncomment this part when link is ready.
        label.font = label.font.withSize(11)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = .max
        label.textColor = UIColor.gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var startFormsButton = {
        let button = UIButton()
        button.setTitle("Iniciar cadastro", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
//        button.layer.borderColor = UIColor.red.cgColor // ⚠️ Erase these two lines later
//        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(startFormsAction), for: .touchUpInside)
        return button
    }()

    var didTapButton: (() -> Void)?

    // ℹ️ Button action func:
    @objc func startFormsAction() {
        didTapButton?()
        print("start forms action")
    }

    // ℹ️ General setup of the screen and constraints:
    override func didMoveToWindow() {
        super.didMoveToWindow()
        buildLayout()
    }
}

extension FormOnboardingView: ViewCodingProtocol {
    func setupView() {
        backgroundColor = .systemBackground
    }

    func setupHierarchy() {

        documentsListStack.addArrangedSubview(idStack)
        documentsListStack.addArrangedSubview(homeStack)
        documentsListStack.addArrangedSubview(photoStack)
        add(subviews:
            girlAndDogImage,
            formsIntro,
            documentsListStack,
            securityIcon,
            securityInfo,
            startFormsButton
        )
    }

    func setupConstraints() {
        setupIconsConstraints()
        setupGirlAndDogImage()
        setupFormsIntro()
        setupDocumentsListStack()
        setupSecurityIcon()
        setupSecurityInfo()
        setupstartFormsButton()
    }
}

extension FormOnboardingView {
    func setupIconsConstraints() {
        NSLayoutConstraint.activate([
            idIcon.heightAnchor.constraint(equalToConstant: 26),
            idIcon.widthAnchor.constraint(equalToConstant: 26),
            homeIcon.heightAnchor.constraint(equalToConstant: 26),
            homeIcon.widthAnchor.constraint(equalToConstant: 26),
            photoIcon.heightAnchor.constraint(equalToConstant: 26),
            photoIcon.widthAnchor.constraint(equalToConstant: 26)
        ])
    }

    func setupGirlAndDogImage() {
        NSLayoutConstraint.activate([
            girlAndDogImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            girlAndDogImage.widthAnchor.constraint(equalTo: self.widthAnchor),
            girlAndDogImage.heightAnchor.constraint(equalToConstant: 235)
        ])
    }
    func setupFormsIntro() {
        NSLayoutConstraint.activate([
            formsIntro.topAnchor.constraint(equalTo: girlAndDogImage.bottomAnchor, constant: 15),
            formsIntro.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            formsIntro.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
    }
    func setupDocumentsListStack() {
        NSLayoutConstraint.activate([
            documentsListStack.topAnchor.constraint(equalTo: formsIntro.bottomAnchor, constant: 15),
            documentsListStack.leadingAnchor.constraint(equalTo: formsIntro.leadingAnchor),
            documentsListStack.trailingAnchor.constraint(equalTo: formsIntro.trailingAnchor)
        ])
    }
    func setupSecurityIcon() {
        NSLayoutConstraint.activate([
            securityIcon.heightAnchor.constraint(equalToConstant: 20),
            securityIcon.widthAnchor.constraint(equalToConstant: 20),
            securityIcon.bottomAnchor.constraint(equalTo: securityInfo.topAnchor, constant: -5),
            securityIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    func setupSecurityInfo() {
        NSLayoutConstraint.activate([
//            securityInfo.topAnchor.constraint(equalTo: securityIcon.bottomAnchor, constant: 5),
            securityInfo.leadingAnchor.constraint(equalTo: formsIntro.leadingAnchor),
            securityInfo.trailingAnchor.constraint(equalTo: formsIntro.trailingAnchor),
            securityInfo.bottomAnchor.constraint(equalTo: startFormsButton.topAnchor, constant: -5)
        ])
    }
    func setupstartFormsButton() {
        NSLayoutConstraint.activate([
            startFormsButton.topAnchor.constraint(equalTo: securityInfo.bottomAnchor, constant: 5),
            startFormsButton.leadingAnchor.constraint(equalTo: formsIntro.leadingAnchor),
            startFormsButton.trailingAnchor.constraint(equalTo: formsIntro.trailingAnchor),
            startFormsButton.heightAnchor.constraint(equalToConstant: 48),
            startFormsButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5)

        ])
    }
}
