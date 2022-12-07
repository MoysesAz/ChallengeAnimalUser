//
//  FormTableView.swift
//  ChallengeAnimalUser
//
//  Created by Robson Lima Lopes on 01/12/22.
//

import UIKit

class FormTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .insetGrouped)
        buildLayout()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FormTableView: ViewCodingProtocol {
    func setupView() {
        self.register(
            ImageFormTableViewCell.self,
            forCellReuseIdentifier: "imageCell"
        )
        self.register(
            TextFieldFormTableViewCell.self,
            forCellReuseIdentifier: "textFieldCell"
        )
        self.backgroundColor = .systemBackground
        self.separatorStyle = .none
    }

    func setupHierarchy() {}

    func setupConstraints() {}

}
