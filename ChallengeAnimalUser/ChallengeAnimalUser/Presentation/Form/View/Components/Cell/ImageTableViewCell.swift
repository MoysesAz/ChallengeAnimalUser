//
//  ImageTableViewCell.swift
//  ChallengeAnimalUser
//
//  Created by Robson Lima Lopes on 01/12/22.
//

import UIKit

class ImageFormTableViewCell: UITableViewCell {

    weak var delegate: ImageCellDelegate!

    private var isHorizontal: Bool = false

    lazy var image: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.image = UIImage(named: "Placeholder")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Adicionar Imagem", for: .normal)
        button.backgroundColor = .tintColor
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var heightAnchorHorizontalFalse = {
        image.heightAnchor.constraint(
            equalTo: contentView.widthAnchor
        )
    }()

    lazy var widthAnchorHorizontalFalse = {
        image.widthAnchor.constraint(
            equalTo: contentView.widthAnchor,
            multiplier: 0.75
        )
    }()

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(
        image: UIImage?,
        isHorizontal: Bool
    ) {
        self.isHorizontal = isHorizontal
        self.image.image = image ?? UIImage(named: "Placeholder")
        imageConstraints()

    }
}

extension ImageFormTableViewCell: ViewCodingProtocol {
    func setupView() {
        self.backgroundColor = .clear
        button.addTarget(
            self,
            action: #selector(self.changeImage),
            for: .touchUpInside
        )
    }

    func setupHierarchy() {
        contentView.addSubview(image)
        contentView.addSubview(button)
    }

    func setupConstraints() {
        imageConstraints()
        buttonConstraints()
    }

    func imageConstraints() {
        if isHorizontal {
            NSLayoutConstraint.deactivate([
                heightAnchorHorizontalFalse,
                widthAnchorHorizontalFalse
            ])

            NSLayoutConstraint.activate([
                image.heightAnchor.constraint(
                    equalTo: contentView.widthAnchor,
                    multiplier: 0.65
                ),
                image.widthAnchor.constraint(
                    equalTo: contentView.widthAnchor
                )
            ])
        } else {
            NSLayoutConstraint.activate([
                heightAnchorHorizontalFalse,
                widthAnchorHorizontalFalse,

                image.topAnchor.constraint(
                    equalTo: contentView.topAnchor,
                    constant: 10
                ),
                image.bottomAnchor.constraint(
                    equalTo: contentView.bottomAnchor
                ),
                image.centerXAnchor.constraint(
                    equalTo: contentView.centerXAnchor
                )
            ])
        }
    }

    func buttonConstraints() {
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 170),
            button.bottomAnchor.constraint(
                equalTo: image.bottomAnchor,
                constant: -20
            ),
            button.trailingAnchor.constraint(
                equalTo: image.trailingAnchor,
                constant: -20
            )
        ])
    }

    @objc func changeImage(sender: UIButton!) {
        delegate?.chooseImageAction(buttonTag: sender.tag)
    }
}
