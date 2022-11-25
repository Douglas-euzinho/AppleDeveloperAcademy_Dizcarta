//
//  PlayerView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 21/09/22.
//

import SwiftUI

struct PlayerView: View {
  // MARK: - VARIABLES
  @State var avatar: String
  @State var name: String
  @State var points: Int
  @State var playerPosition: Int?
  @State var isGamePaused: Bool?
  
  // MARK: - BODY
  var body: some View {
    HStack {
      if isGamePaused ?? false {
          GenericFunctions.checkIfImageExist(name: "rankingCircle")
              .resizable()
              .frame(width: 50, height: 50)
              .overlay {
                  Text("\(playerPosition ?? 0)º")
                      .font(Font(name: .dinCondensedBold, size: 15))
                      .padding(.top, 8)
              }
      }
      Image(avatar)
        .resizable()
        .frame(width: isGamePaused ?? false ? 115 : 65, height: isGamePaused ?? false ? 115 : 65)
        .padding(.trailing, isGamePaused ?? false ? -20 : -5)
      
        VStack(alignment: .leading) {
          Text(name)
            .font(Font.custom("DINAlternate-Bold", size: 16))
            .foregroundColor(.white)
        
        Text(points >= 1 ? "\(points) pontos" : "\(points) ponto")
          .font(Font.custom("DINAlternate-Bold", size: 11))
          .foregroundColor(.white)
      } //: VSTACK
    } //: HSTACK
  } //: BODY
} //: BODY

// MARK: - PREVIEW
struct PlayerView_Previews: PreviewProvider {
  static var previews: some View {
    PlayerView(avatar: "avatarRed", name: "Vermelho", points: 10, playerPosition: 4, isGamePaused: true)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
