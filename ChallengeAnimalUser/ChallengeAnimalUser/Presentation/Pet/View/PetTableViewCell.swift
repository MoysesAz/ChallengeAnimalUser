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

    lazy var petImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        //        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    lazy var petLabel: UILabel = {
        let label = UILabel()
        label.text = "pet Indefinido".capitalized
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    lazy var petProperties: UILabel = {
        let label = UILabel()
        label.text =  "X anos, Castrado, Vacinado"
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var petDescription: UILabel = {
        let label = UILabel()
        label.text =  "Pet pronto para ser adotado"
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        buildLayout()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    internal func configureCell() {
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
        var neutered = "Não castrado"
        var vaccined = "Não vacinado"

        if isNeutered {
            neutered = "Castrado"
        }

        if isVaccined {
            vaccined = "Vacinado"
        }

        let text: String = "\(age), \(neutered), \(vaccined)"

        self.petProperties.text = text
    }

}

extension PetTableViewCell: ViewCodingProtocol {

    func setupView() {
        backgroundColor = .systemBackground
    }

    func setupHierarchy() {
        add(subviews: petImage, petLabel, petProperties, petDescription)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            petImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width*0.05),
            petImage.heightAnchor.constraint(equalToConstant: 80),
            petImage.widthAnchor.constraint(equalToConstant: 80),
            petImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            petLabel.topAnchor.constraint(equalTo: petImage.topAnchor),
            petLabel.leadingAnchor.constraint(equalTo: petImage.trailingAnchor, constant: self.bounds.width*0.05),

            petProperties.topAnchor.constraint(equalTo: petLabel.bottomAnchor, constant: 10),
            petProperties.leadingAnchor.constraint(equalTo: petImage.trailingAnchor, constant: self.bounds.width*0.05),

            petDescription.topAnchor.constraint(equalTo: petProperties.bottomAnchor),
            petDescription.leadingAnchor.constraint(equalTo: petImage.trailingAnchor, constant: self.bounds.width*0.05)
        ])
    }

}

extension PetTableViewCell: PetTableViewCellProtocol {}
