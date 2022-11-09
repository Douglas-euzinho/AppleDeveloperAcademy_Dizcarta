//
//  ButtonCardView.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 22/09/22.
//

import SwiftUI

struct ButtonCardView: View {
    
    var iconName: String
    var text: String
    var backgroundImage: String
    
    init(iconName: String, text: String, backgroundImage: String) {
        self.iconName = iconName
        self.text = text
        self.backgroundImage = backgroundImage
    }
    
    var body: some View {
        ZStack {
            Image(backgroundImage)
                .opacity(0.8)
          
            VStack {
                GenericFunctions.checkIfImageExist(name: iconName)
                    .resizable()
                    .frame(width: 28, height: 28)
            }
        }
    }
}

struct ButtonCardView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCardView(iconName: "ButtonAccept", text: "Aceitar", backgroundImage: "acceptButton")
    }
}
