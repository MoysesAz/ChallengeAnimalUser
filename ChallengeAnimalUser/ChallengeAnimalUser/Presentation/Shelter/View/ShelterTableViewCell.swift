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

    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = contentView.bounds.width*0.05
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var shelterLabel: UILabel = {
        let label = UILabel()
        label.text = "Abrigo Indefinido"
        label.numberOfLines = .max
        label.lineBreakMode = .byWordWrapping
        label.font = .preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var shelterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        buildLayout()
    }

    private func configureCell() {
        shelterImage.sd_setImage(with: shelterInfo?.image)
        shelterLabel.text = shelterInfo?.name.trimmingCharacters(in: .whitespaces)
    }

}

extension ShelterTableViewCell: ViewCodingProtocol {
    func setupView() {
        contentView.backgroundColor = .systemBackground
    }

    func setupHierarchy() {
        stack.addArrangedSubview(shelterImage)
        stack.addArrangedSubview(shelterLabel)
        contentView.add(subviews: stack)
    }

    func setupConstraints() {
        shelterLabelConstraints()
        shelterImageConstraints()
        stackConstraints()
    }
}

extension ShelterTableViewCell {

    private func stackConstraints() {

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 10
            ),
            stack.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -10
            ),
            stack.widthAnchor.constraint(
                equalTo: contentView.widthAnchor,
                multiplier: 0.9
            ),
            stack.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            stack.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            )
        ])
    }

    private func shelterLabelConstraints() {
        NSLayoutConstraint.activate([
            shelterLabel.widthAnchor.constraint(
                equalTo: contentView.widthAnchor,
                multiplier: 0.65
            )
        ])
    }

    private func shelterImageConstraints() {
        NSLayoutConstraint.activate([
            shelterImage.heightAnchor.constraint(
                equalToConstant: 80
            ),
            shelterImage.widthAnchor.constraint(
                equalToConstant: 80
            )
        ])
    }
}
