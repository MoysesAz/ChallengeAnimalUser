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
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        buildLayout()
    }

    private func configureCell() {
        shelterImage.sd_setImage(with: shelterInfo?.image)
        shelterLabel.text = shelterInfo?.name
    }

}

extension ShelterTableViewCell: ViewCodingProtocol {
    func setupView() {
        contentView.backgroundColor = .systemBackground
    }

    func setupHierarchy() {
        contentView.add(subviews: shelterImage, shelterLabel)
    }

    func setupConstraints() {
        shelterImageConstraints()
        shelterLabelConstraints()
    }
}

extension ShelterTableViewCell {
    private func shelterImageConstraints() {
        NSLayoutConstraint.activate([
            shelterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                  constant: contentView.bounds.width*0.05),
            shelterImage.heightAnchor.constraint(equalToConstant: 80),
            shelterImage.widthAnchor.constraint(equalToConstant: 80),
            shelterImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    private func shelterLabelConstraints() {
        NSLayoutConstraint.activate([
            shelterLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            shelterLabel.leadingAnchor.constraint(equalTo: shelterImage.trailingAnchor,
                                                  constant: contentView.bounds.width*0.1),
            shelterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5),
            shelterLabel.centerYAnchor.constraint(equalTo: shelterImage.centerYAnchor),
            shelterLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
    }
}
