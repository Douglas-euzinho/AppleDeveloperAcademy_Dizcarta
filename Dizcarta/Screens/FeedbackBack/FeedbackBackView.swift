//
//  FeedbackBackView.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 23/11/22.
//

import SwiftUI

struct FeedbackBackView: View {
    
    @EnvironmentObject var router: Router

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.backgroundAppColor)
                    .ignoresSafeArea(.all)
                VStack(alignment: .center) {
                    VStack(spacing: 20) {
                        Text("Você deseja mesmo sair?")
                            .lineLimit(1, reservesSpace: true)
                            .font(Font(name: .dinCondensedBold, size: 24))
                        .foregroundColor(.white)
                        Text("Ao sair você perderá todo o seu progresso")
                            .lineLimit(2, reservesSpace: true)
                            .font(Font(name: .dinAlternateBold, size: 18))
                            .foregroundColor(.white)
                    }
                    GenericFunctions.checkIfImageExist(name: "gamePausedImage_2")
                    VStack(spacing: -10) {
                        Button {
                            router.goToRoot()
                        } label: {
                            NeonButton(text: "Sair", image: .redPrimaryButton, font: .dinCondensedBold, size: 34)
                                .frame(width: geometry.size.width/1.2, height: geometry.size.height/6.5)
                        }
                        
                        Button {
                            router.popView()
                        } label: {
                            NeonButton(text: "Cancelar", image: .blueButton, font: .dinCondensedBold, size: 30)
                                .frame(width: geometry.size.width/1.2, height: geometry.size.height/6.2)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct FeedbackBackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackBackView()
    }
}
