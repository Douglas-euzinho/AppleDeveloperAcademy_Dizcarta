//
//  ButtonHomeCOmponent.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 06/10/22.
//

import SwiftUI

struct NeonButton: View {
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        HStack {
            GenericFunctions.checkIfImageExist(name: "HomeButtonBackground")
                .overlay {
                    Text(text)
                        .font(Font.custom("DINAlternate-Bold", size: 30))
                        .bold()
                        .foregroundColor(.white)
                }
        }
    }
}

struct NeonButton_Previews: PreviewProvider {
    static var previews: some View {
        NeonButton(text: "auau")
    }
}
