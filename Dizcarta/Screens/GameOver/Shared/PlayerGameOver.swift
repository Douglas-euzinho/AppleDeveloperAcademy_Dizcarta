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
  @State var avatarColor: Color
  @State var podiumPosition: Int
  @State var points: Int
  
  // MARK: - BODY
  var body: some View {
    VStack {
      ZStack(alignment: .bottomLeading) {
        Image(systemName: "person.circle.fill")
          .resizable()
          .frame(width: 94, height: 94)
          .foregroundColor(avatarColor)
          .overlay {
            Circle()
              .stroke(.black, lineWidth: 1 )
          }
        
          Text("\(podiumPosition)")
            .font(.system(size: 22))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .background(
              Circle()
                .frame(width: 35, height: 35)
            )
      } //: ZSTACK
      
      Text(name)
        .font(.system(size: 24))
        .fontWeight(.medium)
        .padding(.vertical, 2)
      
      Text("\(points) pontos")
        .font(.system(size: 15))
        .fontWeight(.semibold)
        .foregroundColor(.configurationButtonUnselected)
        .padding(.horizontal, 25)
        .padding(.vertical, 4)
        .background {
          RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.configurationButtonSelected)
        }
    } //: VSTACK
  }
}

// MARK: - PREVIEW
struct PlayerGameOver_Previews: PreviewProvider {
  static var previews: some View {
    PlayerGameOver(name: "Alice", avatarColor: .avatarColorPurple, podiumPosition: 1, points: 20)
  }
}
