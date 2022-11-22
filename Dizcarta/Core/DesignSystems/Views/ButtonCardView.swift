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
    
    var body: some View {
            VStack {
                ZStack {
                    Image(backgroundImage)
                        .opacity(0.8)
                    GenericFunctions.checkIfImageExist(name: iconName)
                        .resizable()
                        .frame(width: 28, height: 28)
                }
                Text(text)
                    .font(.custom("macrofont", size: 14))
                    .minimumScaleFactor(0.01)
                    .foregroundColor(.white)
            }
    }
}

struct ButtonCardView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCardView(iconName: "ButtonAccept", text: "Aceitar", backgroundImage: "acceptButton")
    }
}
