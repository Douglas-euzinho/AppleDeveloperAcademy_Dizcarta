//
//  PlayerGameOver.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 29/09/22.
//

import SwiftUI

struct PlayerGameOver: View {
  // MARK: - VARIABLES
  @State var name: String
  @State var avatarAsset: String
  @State var podiumPosition: Int
  @State var points: Int
  
  // MARK: - BODY
  var body: some View {
    VStack {
      ZStack(alignment: .bottomLeading) {
        Image(avatarAsset)
          .resizable()
          .frame(width: 150, height: 150)
          .padding(-30)
        
          Text("\(podiumPosition)")
            .font(.system(size: 22))
            .fontWeight(.bold)
            .foregroundColor(.black)
            .background(
              Circle()
                .frame(width: 35, height: 35)
                .foregroundColor(.white)
                .opacity(0.9)
            )
      } //: ZSTACK
      
      Text(name)
        .font(.system(size: 24))
        .foregroundColor(.white)
        .padding(.vertical, 2)
      
      Text("\(points) pontos")
        .font(.system(size: 15))
        .foregroundColor(.black)
        .fontWeight(.semibold)
        .padding(.horizontal, 25)
        .padding(.vertical, 4)
        .background {
          RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .opacity(0.7)
        }
    } //: VSTACK
  }
}

// MARK: - PREVIEW
struct PlayerGameOver_Previews: PreviewProvider {
  static var previews: some View {
      PlayerGameOver(name: "Alice", avatarAsset: "avatarRed", podiumPosition: 1, points: 20)
  }
}
