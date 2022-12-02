//
//  FooterTableView.swift
//  ChallengeAnimalUser
//
//  Created by Robson Lima Lopes on 01/12/22.
//

import UIKit

class FooterFormTableView: UIView {

    weak var delegate: PushButtonFormDelegate!

    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Ir para a próxima etapa", for: .normal)
        button.backgroundColor = .tintColor
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FooterFormTableView: ViewCoding {
    func setupView() {
        button.addTarget(
            self,
            action: #selector(goToNext),
            for: .touchUpInside
        )
    }

    func setupHierarchy() {
        self.addSubview(button)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: 30
            ),
            button.widthAnchor.constraint(
                equalTo: self.widthAnchor
            ),
            button.heightAnchor.constraint(
                equalToConstant: 50
            ),
            button.centerXAnchor.constraint(
                equalTo: self.centerXAnchor
            ),
            button.bottomAnchor.constraint(
                equalTo: self.bottomAnchor
            )
        ])
    }

    @objc func goToNext(sender: UIButton!) {
        delegate?.goToNextView()
    }
}
