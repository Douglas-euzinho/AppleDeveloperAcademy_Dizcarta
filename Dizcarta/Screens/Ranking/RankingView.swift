//
//  RankingView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 26/09/22.
//

import SwiftUI

struct RankingView: View {
  // MARK: - VARIABLES
  @State var isFromHistory: Bool = true
  @EnvironmentObject var gameCore: GameCore
  
  var body: some View {
    ZStack {
      Color(.backgroundAppColor)
        .ignoresSafeArea(.all)
      VStack(alignment: .leading) {
        Text("Placar")
          .font(.custom("DINCondensed-Bold", size: 34))
          .foregroundColor(.white)
          .padding(.vertical, 40)
          .padding(.leading, 30)
        
        DotDividerView()
        
        LazyVStack(alignment: .leading) {
          ForEach(gameCore.getRanking(), id: \.id) { player in
            PlayerView(
              avatar: player.wrappedAvatar,
              name: player.wrappedName,
              points: player.wrappedPoints,
              playerPosition: gameCore.players.firstIndex(of: player) ?? 0
            )
          }
          
        } //: VSTACK
        .padding(.top, 30)
        .padding(30)
        Spacer()
      }
    }
    .navigationBarBackButtonHidden(true)
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        Button {
          HapticManager.send(style: .heavy)
        } label: {
          GenericFunctions.checkIfImageExist(name: "exitButton")
            .colorMultiply(.white)
        }
        .padding()
      }
    }
  }
}

// struct RankingView_Previews: PreviewProvider {
//  static var previews: some View {
//    let devices = ["iPhone SE (3rd generation)","iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
//
//    ForEach(devices, id: \.self) { device in
//      RankingView(isFromHistory: false)
//        .previewDevice(PreviewDevice(rawValue: device))
//        .previewDisplayName(device)
//    }
//  }
// }
