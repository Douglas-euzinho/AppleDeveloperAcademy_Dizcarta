//
//  PlayerGameOver.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 29/09/22.
//

import SwiftUI

struct PlayerGameOver: View {
  // MARK: - VARIABLES
  
  // MARK: - BODY
  var body: some View {
    VStack {
      ZStack(alignment: .bottomLeading) {
        Image(systemName: "person.circle.fill")
          .resizable()
          .frame(width: 94, height: 94)
          .foregroundColor(.red)
          .overlay {
            Circle()
              .stroke(.black, lineWidth: 1 )
          }
        
          Text("1")
            .font(.system(size: 22))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .background(
              Circle()
                .frame(width: 35, height: 35)
            )
      } //: ZSTACK
      
      Text("Alice")
        .font(.system(size: 24))
        .fontWeight(.medium)
        .padding(.vertical, 2)
      
      Text("20 pontos")
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
    PlayerGameOver()
  }
}
