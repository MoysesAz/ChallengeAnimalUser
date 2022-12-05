//
//  UIView+.swift
//  ChallengeAnimalUser
//
//  Created by Joan Wilson Oliveira on 01/12/22.
//

import UIKit

extension UIView {
    func add(subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
}
