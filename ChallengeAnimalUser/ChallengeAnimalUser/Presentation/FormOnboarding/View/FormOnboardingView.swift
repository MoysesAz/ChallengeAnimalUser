//
//  FormOnboardingView.swift
//  ChallengeAnimalUser
//
//  Created by Pedro Muniz on 06/12/22.
//  What should I do next?... 🤔💭

import UIKit

class FormOnboardingView: UIView {
    let girlAndDogImage = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "girlAndDogImage")
        return imageView
    }() // 💡 The parenthesis is here to execute the scope above as soon as the class is initialized (when that happens, all of the class' properties are initialized)
    
    let formsIntro = {
        let formsIntro = UILabel()
        formsIntro.text = "Pessoas acima de 21 anos podem fazer um cadastro para solicitar a adoção de um animal. Separe os seguintes documentos:"
        return formsIntro
    }()
    
    let documentsList = {
        let stackView = UIStackView()
        
        return stackView
    }()
    
    let securityIcon = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "securityIcon")
        return imageView
    }()
    
    let homeIcon = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "homeIcon")
        return imageView
    }()
    
    let idIcon = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "idIcon")
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
    
    let securityInfo = {
        let label = UILabel()
        label.text = "Respeitamos sua privacidade. Seus dados serão compartilhados apenas com o abrigo responsável. Saiba mais sobre o uso de dados pessoais."
        return label
    }()
    
    lazy var startForms = {
        let button = UIButton()
        button.setTitle("Iniciar cadastro", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(startFormsAction), for: .touchUpInside)
        return button
    }()
    
    @objc func startFormsAction() {
        print("start forms action")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        addViews()
    }
    
    func addViews() {
        addSubview(girlAndDogImage)
        addSubview(formsIntro)
        addSubview(documentsList)
    }
}
