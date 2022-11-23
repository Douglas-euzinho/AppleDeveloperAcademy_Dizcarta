//
//  FontsEnum.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 11/10/22.
//

import SwiftUI

extension Font {
    init(name: FontsName?, size: Float?) {
        self = Font.custom(name?.rawValue ?? "DINAlternate-Bold", size: CGFloat(size ?? 30))
    }
}

enum FontsName: String {
    case dinAlternateBold = "DINAlternate-Bold"
    case dinCondensedBold = "DINCondensed-Bold"
}
