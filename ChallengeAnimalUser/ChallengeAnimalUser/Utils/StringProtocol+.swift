//
//  StringProtocol+.swift
//  ChallengeAnimalUser
//
//  Created by Moyses Miranda do Vale Azevedo on 02/12/22.
//

import Foundation

extension StringProtocol {
    var stripingDiacritics: String {
        applyingTransform(.stripDiacritics, reverse: false)!
    }
}
