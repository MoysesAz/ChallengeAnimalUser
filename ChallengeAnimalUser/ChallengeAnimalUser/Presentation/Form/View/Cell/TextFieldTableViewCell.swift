//
//  TextFieldTableViewCell.swift
//  ChallengeAnimalUser
//
//  Created by Robson Lima Lopes on 01/12/22.
//

import UIKit

class TextFieldFormTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TextFieldFormTableViewCell: ViewCoding {
    func setupView() {}
    
    func setupHierarchy() {}
    
    func setupConstraints() {}
}
