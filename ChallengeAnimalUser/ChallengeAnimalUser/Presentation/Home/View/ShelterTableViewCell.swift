//
//  ShelterTableViewCell.swift
//  ChallengeAnimalUser
//
//  Created by Joan Wilson Oliveira on 29/11/22.
//

import UIKit

final class ShelterTableViewCell: UITableViewCell {

    static var identifier = "ShelterTableViewCell"

    lazy var shelterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    lazy var shelterLabel: UILabel = {
        let label = UILabel()
        label.text = "Abrigo Indefinido"
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        buildLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ShelterTableViewCell: ViewCoding {
    func setupView() {

    }

    func setupHierarchy() {
        self.addSubview(shelterImage)
        self.addSubview(shelterLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            shelterImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            shelterImage.heightAnchor.constraint(equalToConstant: 60),


            shelterLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            shelterLabel.leadingAnchor.constraint(equalTo: shelterImage.trailingAnchor, constant: 30),
            shelterLabel.heightAnchor.constraint(equalToConstant: 30),
            shelterLabel.widthAnchor.constraint(equalToConstant: 40)
        ])

    }


}
