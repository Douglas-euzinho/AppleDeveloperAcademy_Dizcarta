//
//  GenericFunctions.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 23/09/22.
//

import SwiftUI

class GenericFunctions {
    func checkIfImageExist(name: String) -> Image {
        let uiImage = (UIImage(named: name) ?? UIImage(named: "MissingImage"))!
        return Image(uiImage: uiImage)
    }
}
