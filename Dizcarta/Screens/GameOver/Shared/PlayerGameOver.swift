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
  @State var points: Int
  let podiumPosition: Int
  private let podiumAssets = [
    1 : Color(.yellow),
    2 : Color(.gray),
    3 : Color(.brown),
    4 : Color(.green)
  ]
  
  // MARK: - BODY
  var body: some View {
    if podiumPosition < 4 {
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
                .foregroundColor(podiumAssets[podiumPosition])
                .opacity(0.9)
            )
        } //: ZSTACK
        
        Text(name)
          .font(.system(size: 24))
          .foregroundColor(.white)
          .padding(.vertical, 2)
        
        Text("\(points) pontos")
          .font(.system(size: 15))
          .foregroundColor(.white)
          .fontWeight(.semibold)
          .padding(.horizontal, 25)
          .padding(.vertical, 4)
      } //: VSTACK
    } else {
      HStack {
        Text("\(podiumPosition)")
          .font(.system(size: 22))
          .fontWeight(.bold)
          .foregroundColor(.black)
          .background(
            Circle()
              .frame(width: 35, height: 35)
              .foregroundColor(podiumAssets[4])
              .opacity(0.9)
          )
          .padding(.horizontal, 40)
                
        Image(avatarAsset)
          .resizable()
          .frame(width: 96, height: 96)
          .padding(-20)
        
        VStack(alignment: .leading) {
          Text(name)
            .font(.system(size: 18))
            .foregroundColor(.white)
            .padding(.vertical, 2)
          
          Text("\(points) pontos")
            .font(.system(size: 14))
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .padding(.vertical, 4)
          
        }
        .padding(.horizontal, 20)
        
        Spacer()
      }
    }
  }
}

// MARK: - PREVIEW
struct PlayerGameOver_Previews: PreviewProvider {
  static var previews: some View {
    PlayerGameOver(name: "Alice", avatarAsset: "avatarRed", points: 20, podiumPosition: 4)
      .preferredColorScheme(.dark)
  }
}
