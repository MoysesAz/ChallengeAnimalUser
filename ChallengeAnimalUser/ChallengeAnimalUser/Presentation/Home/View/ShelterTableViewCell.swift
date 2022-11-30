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
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    lazy var shelterLabel: UILabel = {
        let label = UILabel()
        label.text = "Abrigo Indefinido"
        label.font = .systemFont(ofSize: 20)
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

extension ShelterTableViewCell: ViewCoding {
    func setupView() {

    }

    func setupHierarchy() {
        self.addSubview(shelterImage)
        self.addSubview(shelterLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            shelterImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width*0.08),
            shelterImage.heightAnchor.constraint(equalToConstant: 60),
            shelterImage.widthAnchor.constraint(equalToConstant: 60),
            shelterImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            shelterLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            shelterLabel.leadingAnchor.constraint(equalTo: shelterImage.trailingAnchor, constant: self.bounds.width*0.1)
        ])

    }

}
