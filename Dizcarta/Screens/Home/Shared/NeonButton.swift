//
//  ButtonHomeCOmponent.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 06/10/22.
//

import SwiftUI

struct NeonButton: View {
    var text: String
    var image: ButtonsNameImage
    var font: FontsName
    
    init(text: String, image: ButtonsNameImage, font: FontsName) {
        self.text = text
        self.image = image
        self.font = font
    }
    
    var body: some View {
        HStack {
            GenericFunctions.checkIfImageExist(name: image.rawValue)
                .resizable()
                .overlay {
                    Text(text)
                        .font(Font(name: font, size: 28))
                        .bold()
                        .foregroundColor(.white)
                }
            
        }
    }
}

struct NeonButton_Previews: PreviewProvider {
    static var previews: some View {
        NeonButton(text: "auau", image: .redButton, font: .dinAlternateBold)
    }
}
