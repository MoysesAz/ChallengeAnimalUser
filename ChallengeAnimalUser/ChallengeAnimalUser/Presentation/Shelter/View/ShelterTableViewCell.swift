//
//  ShelterTableViewCell.swift
//  ChallengeAnimalUser
//
//  Created by Joan Wilson Oliveira on 29/11/22.
//
import UIKit
import SDWebImage



final class ShelterTableViewCell: UITableViewCell {

    static var identifier = "ShelterTableViewCell"

    var shelterInfo: Shelter? {
        didSet {
            configureCell()
        }
    }

    lazy var shelterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    lazy var shelterLabel: UILabel = {
        let label = UILabel()
        label.text = "Abrigo Indefinido"
        label.font = .systemFont(ofSize: 20, weight: .medium)
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

    private func configureCell() {
        shelterImage.sd_setImage(with: shelterInfo?.image)
        shelterLabel.text = shelterInfo?.name
    }

}

extension ShelterTableViewCell: ViewCodingProtocol {
    func setupView() {
        self.backgroundColor = .white
    }

    func setupHierarchy() {
        self.addSubview(shelterImage)
        self.addSubview(shelterLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            shelterImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width*0.05),
            shelterImage.heightAnchor.constraint(equalToConstant: 80),
            shelterImage.widthAnchor.constraint(equalToConstant: 80),
            shelterImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            shelterLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            shelterLabel.leadingAnchor.constraint(equalTo: shelterImage.trailingAnchor, constant: self.bounds.width*0.1)
        ])

    }

}
