//
//  PlayerView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 21/09/22.
//

import SwiftUI

struct PlayerView: View {
  // MARK: - VARIABLES
  @State var name: String
  @State var avatar: String
  @State var points: Int?
  
  // MARK: - BODY
  var body: some View {
    HStack {
      Image(avatar)
        .resizable()
        .frame(width: 60, height: 60)
        .padding(.trailing, -14)
      
      VStack(alignment: .leading) {
        HStack {
          Text(name)
            .font(Font.custom("DINAlternate-Bold", size: 16))
            .foregroundColor(.white)
        }
        
        if let points {
          HStack {
            Text("\(points)")
                .font(Font.custom("DINAlternate-Bold", size: 11))
                .foregroundColor(.black)
            Text(points == 1 ? "ponto" : "pontos")
                  .font(Font.custom("DINAlternate-Bold", size: 11))
                  .foregroundColor(.black)
          } //: HSTACK
//          .padding(.vertical, 1)
          .padding(.horizontal, 8)
          .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .opacity(0.7)
          )
        } //: IF
      } //: VSTACK
    } //: HSTACK
  } //: BODY
}

// MARK: - PREVIEW
struct PlayerView_Previews: PreviewProvider {
  static var previews: some View {
      PlayerView(name: "Vermelho", avatar: "avatarRed", points: 10)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
