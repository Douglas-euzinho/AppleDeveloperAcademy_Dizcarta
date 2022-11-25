//
//  GameOverView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 29/09/22.
//

import SwiftUI

struct GameOverView: View {
  // MARK: - VARIABLES
  @EnvironmentObject var router: Router
  @State private var players = [Player]()
  
  // MARK: - BODY
  var body: some View {
      GeometryReader { geometry in
        ZStack {
          Color(.backgroundAppColor)
            .ignoresSafeArea(.all)
          
          VStack {
              HStack {
                  Text("Fim de Jogo!")
                    .font(.system(size: 34))
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                  Spacer()
              }
              .padding(.top, 20)
              .padding(.leading, 24)
          
              DotDividerView()
                  .padding(.top, 20)
              if !router.gameCore.players.isEmpty {
                  ScrollView(.vertical, showsIndicators: true) {
                      VStack {
                          PlayerGameOver(name: router.gameCore.getRanking()[0].wrappedName,
                                         avatarAsset: router.gameCore.getRanking()[0].wrappedAvatar,
                                         points: router.gameCore.getRanking()[0].wrappedPoints,
                                         podiumPosition: 1)
                          .padding(.bottom, 20)
                          .padding(.top, 20)
                          
                          HStack(spacing: 60) {
                              PlayerGameOver(name: router.gameCore.getRanking()[1].wrappedName,
                                             avatarAsset: router.gameCore.getRanking()[1].wrappedAvatar,
                                             points: router.gameCore.getRanking()[1].wrappedPoints,
                                             podiumPosition: 2)
                              
                              PlayerGameOver(name: router.gameCore.getRanking()[2].wrappedName,
                                             avatarAsset: router.gameCore.getRanking()[2].wrappedAvatar,
                                             points: router.gameCore.getRanking()[2].wrappedPoints,
                                             podiumPosition: 3)
                          }
                          
                          ForEach(players, id: \.self) { player in
                              PlayerGameOver(name: player.wrappedName,
                                             avatarAsset: player.wrappedAvatar,
                                             points: player.wrappedPoints,
                                             podiumPosition: (players.firstIndex(of: player) ?? 0) + 4)
                              .padding()
                          }
                      }
                      
                      Spacer()
                      
                      Button {
                          HapticManager.send(style: .heavy)
                          router.newGame()
                      } label: {
                          NeonButton(text: "Novo Jogo", image: .redButton, font: .dinCondensedBold)
                              .frame(width: geometry.size.width / 1.6, height: geometry.size.height / 15)
                              .shadow(radius: 5)
                              .padding(20)
                      }
                  }
                  .onAppear {
                      players = router.gameCore.getRanking()
                      players.removeSubrange(0...2)
                  }
                  .padding(.top, 20)
              }
          }
          .navigationBarBackButtonHidden(true)
          .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
              Button {
                HapticManager.send(style: .heavy)
                  router.popView()
              } label: {
                GenericFunctions.checkIfImageExist(name: "exitButton")
                  .colorMultiply(.white)
              }
            }
          }
      }
    }
    //: VSTACK
  }
}

// MARK: - PREVIEW
// struct GameOverView_Previews: PreviewProvider {
//  static var previews: some View {
//    let devices = ["iPhone SE (3rd generation)","iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
//
//    ForEach(devices, id: \.self) { device in
//      GameOverView()
//        .previewDevice(PreviewDevice(rawValue: device))
//        .previewDisplayName(device)
//    }
//  }
// }
