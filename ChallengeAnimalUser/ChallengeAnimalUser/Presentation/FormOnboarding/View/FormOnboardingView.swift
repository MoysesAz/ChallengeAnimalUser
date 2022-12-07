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
        imageView.layer.borderColor = UIColor.red.cgColor // ⚠️ Erase these two lines later
        imageView.layer.borderWidth = 1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }() // 💡 The parenthesis is here to execute the scope above as soon as the class is initialized (when that happens, all of the class' properties are initialized)
    let formsIntro = {
        let formsIntro = UILabel()
        formsIntro.text = "Pessoas acima de 21 anos podem fazer um cadastro para solicitar a adoção de um animal. Separe os seguintes documentos:"
        formsIntro.layer.borderColor = UIColor.red.cgColor // ⚠️ Erase these two lines later
        formsIntro.layer.borderWidth = 1
        formsIntro.translatesAutoresizingMaskIntoConstraints = false
        return formsIntro
    }()
    lazy var documentsListStack = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5.0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(idStack)
        stackView.addArrangedSubview(homeStack)
        stackView.addArrangedSubview(photoStack)
        stackView.layer.borderColor = UIColor.red.cgColor // ⚠️ Erase these two lines later
        stackView.layer.borderWidth = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var idStack = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.addArrangedSubview(idIcon)
        stackView.addArrangedSubview(idIconLabel)
        return stackView
    }()
    lazy var homeStack = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.addArrangedSubview(homeIcon)
        stackView.addArrangedSubview(homeIconLabel)
        return stackView
    }()
    lazy var photoStack = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.addArrangedSubview(photoIcon)
        stackView.addArrangedSubview(photoIconLabel)
        return stackView
    }()
    let idIcon = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "idIcon")
        return imageView
    }()
    let homeIcon = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "homeIcon")
        return imageView
    }()
    let photoIcon = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "photoIcon")
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
        imageView.layer.borderColor = UIColor.red.cgColor // ⚠️ Erase these two lines later
        imageView.layer.borderWidth = 1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let securityInfo = {
        let label = UILabel()
        label.text = "Respeitamos sua privacidade. Seus dados serão compartilhados apenas com o abrigo responsável. Saiba mais sobre o uso de dados pessoais."
        label.layer.borderColor = UIColor.red.cgColor // ⚠️ Erase these two lines later
        label.layer.borderWidth = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var startFormsButton = {
        let button = UIButton()
        button.setTitle("Iniciar cadastro", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.red.cgColor // ⚠️ Erase these two lines later
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(startFormsAction), for: .touchUpInside)
        return button
    }()
    // ℹ️ Button action func:
    @objc func startFormsAction() {
        print("start forms action")
    }
    // ℹ️ General setup of the screen:
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
        add(subviews:
            girlAndDogImage,
            formsIntro,
            documentsListStack,
//            idStack,
//            homeStack,
//            photoStack,
//            idIcon,
//            homeIcon,
//            photoIcon,
//            idIconLabel,
//            homeIconLabel,
//            photoIconLabel,
            securityIcon,
            securityInfo,
            startFormsButton
        )
    }
    
    func setupConstraints() {
        setupGirlAndDogImage()
    }
}

extension FormOnboardingView {
    func setupGirlAndDogImage() {
        NSLayoutConstraint.activate([
            girlAndDogImage.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>),
            girlAndDogImage.bottomAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>),
            girlAndDogImage.leadingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>),
            girlAndDogImage.trailingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>)
        ])
    }
    func setupFormsIntro() {
        NSLayoutConstraint.activate([
            formsIntro.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>),
            formsIntro.bottomAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>),
            formsIntro.leadingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>),
            formsIntro.trailingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>)
        ])
    }
    func setupDocumentsListStack() {
        NSLayoutConstraint.activate([
            documentsListStack.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>),
            documentsListStack.bottomAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>),
            documentsListStack.leadingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>),
            documentsListStack.trailingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>)
        ])
    }
    func setupSecurityIcon() {
        NSLayoutConstraint.activate([
            securityIcon.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>),
            securityIcon.bottomAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>),
            securityIcon.leadingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>),
            securityIcon.trailingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>)
        ])
    }
    func setupSecurityInfo() {
        NSLayoutConstraint.activate([
            securityInfo.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>),
            securityInfo.bottomAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>),
            securityInfo.leadingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>),
            securityInfo.trailingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>)
        ])
    }
    func setupstartFormsButton() {
        NSLayoutConstraint.activate([
            startFormsButton.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>),
            startFormsButton.bottomAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>),
            startFormsButton.leadingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>),
            startFormsButton.trailingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>)
        ])
    }
}
