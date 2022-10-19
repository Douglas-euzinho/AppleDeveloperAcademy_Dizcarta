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
                .resizable()
                .cornerRadius(10)
                .opacity(0.8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.black)
                        .opacity(0.3)
                        .frame(width: 140, height: 67)
                )
            
            VStack {
                GenericFunctions.checkIfImageExist(name: iconName)
                    .resizable()
                    .frame(width: 32, height: 32)
                
                Text(text)
                    .font(.custom("macrofont", size: 15))
                    .minimumScaleFactor(0.01)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ButtonCardView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCardView(iconName: "ButtonAccept", text: "Aceitar", backgroundImage: "acceptButton")
    }
}
