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
  var rankingCircle: String = "rankingCircle"
  
  // MARK: - BODY
  var body: some View {
    HStack {
      if isGamePaused ?? false {
        Image(rankingCircle)
          .resizable()
          .frame(width: 60, height: 60)
          .overlay {
            Text("\(playerPosition ?? 0) º")
              .font(.custom("DINAlternate-Bold", size: 20))
          }
      }
      
      Image(avatar)
        .resizable()
        .frame(width: 65, height: 65)
        .padding(.trailing, -14)
      
      VStack(alignment: .leading) {
        HStack {
          Text(name)
            .font(Font.custom("DINAlternate-Bold", size: 16))
            .foregroundColor(.white)
        }
        
        Text(points >= 1 ? "\(points) pontos" : "\(points) ponto")
          .font(Font.custom("DINAlternate-Bold", size: 11))
          .foregroundColor(.white)
      } //: HSTACK
      .padding(.horizontal, 8)
    } //: VSTACK
  } //: HSTACK
} //: BODY

// MARK: - PREVIEW
struct PlayerView_Previews: PreviewProvider {
  static var previews: some View {
    PlayerView(avatar: "avatarRed", name: "Vermelho", points: 10, playerPosition: 4, isGamePaused: true)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
