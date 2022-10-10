//
//  GenericFunctions.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 23/09/22.
//

import SwiftUI

class GenericFunctions {
    static func checkIfImageExist(name: String) -> Image {
        let uiImage = (UIImage(named: name) ?? UIImage(named: "MissingImage"))!
        return Image(uiImage: uiImage)
    }
    
    static func checkIfImageEnumExist(name: ButtonsNameImage) -> Image {
        let uiImage = (UIImage(named: name.rawValue) ?? UIImage(named: "MissingImage"))!
        return Image(uiImage: uiImage)
    }
}
