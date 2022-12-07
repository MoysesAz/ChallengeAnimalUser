//
//  PetTableViewCell.swift
//  ChallengeAnimalUser
//
//  Created by Joan Wilson Oliveira on 01/12/22.
//

import UIKit
import SDWebImage

protocol PetTableViewCellProtocol: UITableViewCell {
    static var identifier: String { get }
    var petInfo: PetModel? { get set }
    func configureCell()
}

final class PetTableViewCell: UITableViewCell {
    static let identifier: String = "PetTableViewCell"

    var petInfo: PetModel? {
        didSet {
            configureCell()
        }
    }

    private lazy var petImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var petLabel: UILabel = {
        let label = UILabel()
        label.text = "pet Indefinido".capitalized
        label.numberOfLines = .max
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var petProperties: UILabel = {
        let label = UILabel()
        label.text = "X anos, Castrado, Vacinado"
        label.numberOfLines = .max
        label.lineBreakMode = .byWordWrapping
        label.font = .preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var petDescription: UILabel = {
        let label = UILabel()
        label.text = "Pet pronto para ser adotado"
        label.numberOfLines = .max
        label.lineBreakMode = .byWordWrapping
        label.font = .preferredFont(forTextStyle: .footnote)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        buildLayout()
    }

    public func configureCell() {
        petImage.sd_setImage(with: petInfo?.image)
        petImage.layer.cornerRadius = 10
        petLabel.text = petInfo?.name.capitalized
        setPetProperties(
            age: petInfo?.name ?? "Desconhecido",
            isNeutered: petInfo?.isNeutered ?? false,
            isVaccined: petInfo?.isNeutered ?? false
        )
    }

    private func setPetProperties(age: String, isNeutered: Bool, isVaccined: Bool) {
        let neutered = isNeutered ? "Castrado" : "Não castrado"
        let vaccined = isVaccined ? "Vacinado" : "Não vacinado"
        let text: String = "\(age), \(neutered), \(vaccined)"
        petProperties.text = text
    }

}

extension PetTableViewCell: ViewCodingProtocol {

    func setupView() {
        backgroundColor = .systemBackground
    }

    func setupHierarchy() {
        contentView.add(subviews: petImage, petLabel, petProperties, petDescription)
    }

    func setupConstraints() {
        petImageConstraints()
        petLabelConstraints()
        petPropertiesConstraints()
        petDescriptionConstraints()
    }
}

extension PetTableViewCell {

    func petImageConstraints() {
        NSLayoutConstraint.activate([
            petImage.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: contentView.bounds.width*0.05
            ),
            petImage.heightAnchor.constraint(
                equalToConstant: 80
            ),
            petImage.widthAnchor.constraint(
                equalToConstant: 80
            ),
            petImage.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            )
        ])
    }

    func petLabelConstraints() {
        NSLayoutConstraint.activate([
            petLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 10
            ),
            petLabel.leadingAnchor.constraint(
                equalTo: petImage.trailingAnchor,
                constant: contentView.bounds.width*0.05
            ),
            petLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -contentView.bounds.width*0.05
            )
        ])
    }

    func petPropertiesConstraints() {
        NSLayoutConstraint.activate([
            petProperties.topAnchor.constraint(
                equalTo: petLabel.bottomAnchor,
                constant: 10
            ),
            petProperties.leadingAnchor.constraint(
                equalTo: petImage.trailingAnchor,
                constant: contentView.bounds.width*0.05
            ),
            petProperties.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -contentView.bounds.width*0.05
            )
        ])
    }

    func petDescriptionConstraints() {
        NSLayoutConstraint.activate([
            petDescription.topAnchor.constraint(
                equalTo: petProperties.bottomAnchor
            ),
            petDescription.leadingAnchor.constraint(
                equalTo: petImage.trailingAnchor,
                constant: contentView.bounds.width*0.05
            ),
            petDescription.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -10
            ),
            petDescription.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -contentView.bounds.width*0.05
            )
        ])
    }

}

extension PetTableViewCell: PetTableViewCellProtocol {}
