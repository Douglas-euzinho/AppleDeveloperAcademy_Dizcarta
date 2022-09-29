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
    
    init(iconName: String, text: String) {
        self.iconName = iconName
        self.text = text
    }
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(minWidth: 110, idealWidth: 115, maxWidth: 130, minHeight: 60, idealHeight: 65, maxHeight: 80)
                .cornerRadius(20)
                .foregroundColor(.white)
                .shadow(radius: 7)
                .overlay {
                    VStack {
                        Spacer(minLength: 10)
                        GenericFunctions.checkIfImageExist(name: iconName)
                            .frame(width: 41, height: 10)
                        Spacer()
                        Text(text)
                            .font(.custom("macrofont", size: 20))
                            .minimumScaleFactor(0.01)
                            .foregroundColor(.black)
                    }
                    .padding(5)
                }
                .padding(10)
        }.frame(width: .infinity, height: .infinity)
    }
}

struct ButtonCardView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCardView(iconName: "ButtonAccept", text: "Aceitar")
    }
}
