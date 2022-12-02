//
//  TextFieldTableViewCell.swift
//  ChallengeAnimalUser
//
//  Created by Robson Lima Lopes on 01/12/22.
//

import UIKit

class TextFieldFormTableViewCell: UITableViewCell {

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.autocorrectionType = .yes
        textField.font = .preferredFont(forTextStyle: .title3)
        textField.backgroundColor = .secondarySystemBackground
        textField.textColor = .label
        textField.clearButtonMode = .whileEditing
        textField.contentVerticalAlignment = .center
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField

    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(form: Form, indexPath: IndexPath) {
        switch form {
        case .userContact:
            switch indexPath.row {
            case 0:
                textField.keyboardType = .emailAddress
                textField.placeholder = "e-mail"
            case 1:
                textField.keyboardType = .numberPad
                textField.placeholder = "telefone"
            default:
                fatalError("indexPath does no match with form .userContact")
            }
        case .textToONG:
            textField.placeholder = "Opcional: Insira um texto para o abrigo"
        default:
            fatalError("form does not match with textField requirement")
        }
    }

}

extension TextFieldFormTableViewCell: ViewCoding {
    func setupView() {
        self.backgroundColor = .clear
    }

    func setupHierarchy() {
        contentView.addSubview(textField)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(
                greaterThanOrEqualToConstant: 80
            ),
            textField.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 15
            ),
            textField.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
            textField.widthAnchor.constraint(
                equalTo: contentView.widthAnchor
            )
        ])
    }
}
