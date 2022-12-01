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
    var size: Float
    
    var body: some View {
        ZStack {
            GenericFunctions.checkIfImageExist(name: image.rawValue)
            VStack(alignment: .center) {
                Text(text)
                    .font(Font(name: font, size: size))
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 10)
        }
    }
}

struct NeonButton_Previews: PreviewProvider {
    static var previews: some View {
        NeonButton(text: "auau", image: .redPrimaryButton, font: .dinAlternateBold, size: 20)
    }
}
