//
//  LoginScreen.swift
//  LIPEF
//
//  Created by Tales Valente on 14/10/22.
//

import Foundation
import UIKit

protocol LoginViewDelegate: AnyObject {
    func loginView(_ loginView: LoginView, didTapOnLoginButton button: UIButton)
}

class LoginView: UIScrollView {

    //weak var delegate: Login?


    
    lazy var parallaxBlock1: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "parallaxBlock1")

        // FOR DEBUG ONLY
        image.layer.borderColor = UIColor.blue.cgColor
        image.layer.borderWidth = 1
        // - - - - - - - -
        return image
    }()
    lazy var parallaxBlock2: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "parallaxBlock2")

        // FOR DEBUG ONLY
        image.layer.borderColor = UIColor.red.cgColor
        image.layer.borderWidth = 1
        // - - - - - - - -
        return image
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.text = "Salve uma vida"
        // FOR DEBUG ONLY
        label.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 1
        // - - - - - - - -
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .body)
        label.numberOfLines = .max
        label.lineBreakMode = .byWordWrapping
        label.text = "Uma forma prática de encontrar os animais nos abrigos mais próximos de você e lhes dar a chance de ter um novo lar."
        // FOR DEBUG ONLY
        label.layer.borderColor = UIColor.green.cgColor
        label.layer.borderWidth = 1
        // - - - - - - - -
        return label
    }()

    lazy var tick1: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "TICK")

        // FOR DEBUG ONLY
        image.layer.borderColor = UIColor.blue.cgColor
        image.layer.borderWidth = 1
        // - - - - - - - -
        return image
    }()

    lazy var tick1Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 0
        label.text = "Veja todos os abrigos próximos"
        // FOR DEBUG ONLY
        label.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 1
        // - - - - - - - -
        return label
    }()
    lazy var tick2: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "TICK")

        // FOR DEBUG ONLY
        image.layer.borderColor = UIColor.blue.cgColor
        image.layer.borderWidth = 1
        // - - - - - - - -
        return image
    }()
    lazy var tick2Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 0
        label.text = "Busque pelo animal ideal para você"
        // FOR DEBUG ONLY
        label.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 1
        // - - - - - - - -
        return label
    }()
    lazy var tick3: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "TICK")

        // FOR DEBUG ONLY
        image.layer.borderColor = UIColor.blue.cgColor
        image.layer.borderWidth = 1
        // - - - - - - - -
        return image
    }()

    lazy var tick3Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 0
        label.text = "Envie o pedido de adoção pelo próprio app"
        // FOR DEBUG ONLY
        label.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 1
        // - - - - - - - -
        return label
    }()

    lazy var appleLoginButton: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "appleLoginButton")

        // FOR DEBUG ONLY
        image.layer.borderColor = UIColor.blue.cgColor
        image.layer.borderWidth = 1
        // - - - - - - - -
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }

    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        buildLayout()
    }
}

extension LoginView {
}

extension LoginView: ViewCodingProtocol {
    func setupView() {
        self.backgroundColor = .systemBackground
    }

    func setupHierarchy() {
        self.add(subviews:
                 parallaxBlock1,
                 parallaxBlock2,
                 titleLabel,
                 descriptionLabel,
                 tick1,
                 tick1Label,
                 tick2,
                 tick2Label,
                 tick3,
                 tick3Label,
                 appleLoginButton)
    }

    func setupConstraints() {
        parallaxBlock1Constraints()
        parallaxBlock2Constraints()
        titleLabelConstraints()
        descriptionLabelConstraints()
        tick1Constraints()
        tick1LabelConstraints()
        tick2Constraints()
        tick2LabelConstraints()
        tick3Constraints()
        tick3LabelConstraints()
        appleLoginButtonConstraints()

    }

}

extension LoginView {
    func parallaxBlock1Constraints() {
        NSLayoutConstraint.activate([
            self.parallaxBlock1.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            self.parallaxBlock1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.20),
            self.parallaxBlock1.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    func parallaxBlock2Constraints() {
        NSLayoutConstraint.activate([
            self.parallaxBlock2.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            self.parallaxBlock2.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.20),
            self.parallaxBlock2.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    func titleLabelConstraints() {
        NSLayoutConstraint.activate([
        self.titleLabel.topAnchor.constraint(equalTo: self.parallaxBlock1.bottomAnchor, constant: 20),
        self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
    }
    func descriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.descriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
        ])
    }
    func tick1Constraints() {
        NSLayoutConstraint.activate([
            self.tick1.centerYAnchor.constraint(equalTo: self.tick1Label.centerYAnchor),
            self.tick1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.tick1.widthAnchor.constraint(equalToConstant: 21),
            self.tick1.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
    func tick1LabelConstraints() {
        NSLayoutConstraint.activate([
            self.tick1Label.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 30),
            self.tick1Label.leadingAnchor.constraint(equalTo: self.tick1.trailingAnchor, constant: 5),
            self.tick1Label.trailingAnchor.constraint(equalTo: self.descriptionLabel.trailingAnchor)
        ])
    }
    func tick2Constraints() {
        NSLayoutConstraint.activate([
            self.tick2.centerYAnchor.constraint(equalTo: self.tick2Label.centerYAnchor),
            self.tick2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
    }
    func tick2LabelConstraints() {
        NSLayoutConstraint.activate([
            self.tick2Label.topAnchor.constraint(equalTo: self.tick1Label.bottomAnchor, constant: 15),
            self.tick2Label.leadingAnchor.constraint(equalTo: self.tick1Label.leadingAnchor),
            self.tick2Label.trailingAnchor.constraint(equalTo: self.descriptionLabel.trailingAnchor)
            
        ])
    }
    func tick3Constraints() {
        NSLayoutConstraint.activate([
            self.tick3.centerYAnchor.constraint(equalTo: self.tick3Label.centerYAnchor),
            self.tick3.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
    }
    func tick3LabelConstraints() {
        NSLayoutConstraint.activate([
            self.tick3Label.topAnchor.constraint(equalTo: self.tick2Label.bottomAnchor, constant: 15), // OK
            self.tick3Label.leadingAnchor.constraint(equalTo: self.tick2Label.leadingAnchor), // OK
            self.tick3Label.trailingAnchor.constraint(equalTo: self.descriptionLabel.trailingAnchor)

        ])
    }
    func appleLoginButtonConstraints() {
        NSLayoutConstraint.activate([

            self.appleLoginButton.topAnchor.constraint(equalTo: self.tick3Label.bottomAnchor, constant: 80),
            self.appleLoginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}





// JUNKYARD

//            self.loginTextField.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 32),
//            self.loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            self.loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            self.loginTextField.heightAnchor.constraint(equalToConstant: 39),
//
//            self.createUserToken.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 9),
//            self.createUserToken.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor),
//            self.createUserToken.heightAnchor.constraint(equalToConstant: 16),
//
//            self.loginButtonImg.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor),
//            self.loginButtonImg.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor),
//            self.loginButtonImg.topAnchor.constraint(equalTo: self.loginButton.topAnchor),
//            self.loginButtonImg.bottomAnchor.constraint(equalTo: self.loginButton.bottomAnchor),
//
//            self.loginButton.topAnchor.constraint(equalTo: self.createUserToken.bottomAnchor, constant: 36),
//            self.loginButton.leadingAnchor.constraint(equalTo: self.loginTextField.leadingAnchor),
//            self.loginButton.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor),
//            self.loginButton.heightAnchor.constraint(equalToConstant: 41),
//
//            self.lineView.topAnchor.constraint(equalTo: self.loginButtonImg.bottomAnchor, constant: 48),
//            self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
//            self.lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
//            self.lineView.heightAnchor.constraint(equalToConstant: 0.5),
//
//            self.bindUserIdIcon.leadingAnchor.constraint(equalTo: self.bindUserIdButton.leadingAnchor, constant: 53),
//            self.bindUserIdIcon.centerYAnchor.constraint(equalTo: self.bindUserIdButton.centerYAnchor),
//            self.bindUserIdIcon.heightAnchor.constraint(equalToConstant: 20),
//            self.bindUserIdIcon.widthAnchor.constraint(equalToConstant: 20),
//
//            self.bindUserIdButton.topAnchor.constraint(equalTo: self.lineView.bottomAnchor, constant: 53),
//            self.bindUserIdButton.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor),
//            self.bindUserIdButton.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor),
//            self.bindUserIdButton.heightAnchor.constraint(equalToConstant: 41),


//    lazy var loginButtonImg: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.image = UIImage(named: "gradient3")
//        image.contentMode = .scaleToFill
//        image.clipsToBounds = true
//        image.layer.cornerRadius = 8
//        return image
//    }()
//
//    lazy var loginButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Entrar", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
//        button.setTitleColor(.white, for: .normal)
//        button.clipsToBounds = true
//        button.layer.cornerRadius = 8
//        button.titleLabel?.textAlignment = .center
//        button.addTarget(self, action: #selector(actLogin(sender:)), for: .primaryActionTriggered)
//        return button
//    }()
//
//    lazy var lineView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .white
//        return view
//    }()
//
//    lazy var bindUserIdIcon: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.image = UIImage(named: "appleLogo")
//        return image
//    }()
//
//    lazy var bindUserIdButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
//        button.setTitleColor(.white, for: .normal)
//        button.clipsToBounds = true
//        button.layer.cornerRadius = 8
//        button.titleLabel?.textAlignment = .center
//        button.layer.borderColor = UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1.0).cgColor
//        button.layer.borderWidth = 2
//        button.setTitle("Vincular usuário ao token", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
//        button.setTitleColor(.white, for: .normal)
//        return button
//    }()
