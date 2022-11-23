//
//  AcceptRefuseView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 20/10/22.
//

import SwiftUI

struct AcceptRefuseView: View {
  // MARK: - VARIABLES
    @EnvironmentObject var router: Router
  // MARK: - BODY
  var body: some View {
      GeometryReader { geometry in
        ZStack {
          Color(.backgroundAppColor)
            .ignoresSafeArea(.all)
          
          VStack {
            Spacer()
            
              Image(router.gameCore.playerPlaying?.wrappedAvatar ?? "")
              .resizable()
              .frame(width: 240, height: 240)
              .padding(-20)
            
              Text(router.gameCore.acceptOrRefuseTitle)
              .font(Font.custom("DINCondensed-Bold", size: 34))
              .foregroundColor(.white)
            
              Text(router.gameCore.acceptOrRefuseMessage)
              .font(Font.custom("DINCondensed-Bold", size: 22))
              .foregroundColor(.white)
            
            Spacer()
            
            Button {
              HapticManager.send(style: .heavy)
                if router.gameCore.isGameFinished {
                    router.pushView(screen: .gameOver)
                } else {
                    router.gameCore.nextPlayer()
                    router.pushView(screen: .shiftPlayer)
                }
            } label: {
                NeonButton(text: "Continuar", image: .redButton, font: .dinCondensedBold)
                .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 8)
                .padding(.bottom)
            }
          }
        .navigationBarBackButtonHidden(true)
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button {
                router.pushView(screen: .gamePaused)
            } label: {
              GenericFunctions.checkIfImageExist(name: "pauseButton")
            }
          }
        }
      }
    }
  }
}

// struct AcceptRefuseView_Previews: PreviewProvider {
//    static var previews: some View {
//        AcceptRefuseView(avatar: "avatarRed", title: "Parabéns", text: "Você ganhou 4 pontos")
//    }
// }
