//
//  ButtonCardView.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 22/09/22.
//

import SwiftUI

struct ButtonCardView: View {
    let shared = GenericFunctions()
    
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
                        shared.checkIfImageExist(name: "ButtonAccept")
                            .frame(width: 41, height: 10)
                        Spacer()
                        Text("Aceitar")
                            .font(.custom("macrofont", size: 20))
                            .minimumScaleFactor(0.01)
                            .foregroundColor(.black)
                    }
                    .padding(5)
                }
                .padding(10)
            Rectangle()
                .frame(minWidth: 110, idealWidth: 115, maxWidth: 130, minHeight: 60, idealHeight: 65, maxHeight: 80)
                .cornerRadius(20)
                .foregroundColor(.white)
                .shadow(radius: 7)
                .overlay {
                    VStack {
                        Spacer(minLength: 10)
                        shared.checkIfImageExist(name: "ButtonRefuse")
                                .frame(width: 41, height: 10)
                        Spacer()
                        Text("Recusar")
                            .font(.custom("macrofont", size: 20))
                            .minimumScaleFactor(0.01)
                            .foregroundColor(.black)
                    }
                    .padding(5)
                }
        }.frame(width: .infinity, height: .infinity)
    }
}

struct ButtonCardView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCardView()
    }
}
