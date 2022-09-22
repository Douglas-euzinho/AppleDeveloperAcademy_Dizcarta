//
//  PlayerView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 21/09/22.
//

import SwiftUI

struct PlayerView: View {
  // MARK: - VARIABLES
  @State var name: String = "Alice"
  @State var avatar: String = "person.circle.fill"
  @State var avatarColor: Color = .red
  @State var points: Int? = 10
  
  // MARK: - BODY
  var body: some View {
    HStack {
      Image(systemName: avatar)
        .resizable()
        .frame(width: 45, height: 45)
        .foregroundColor(avatarColor)
        .overlay(content: {
          Circle()
            .stroke(.black, lineWidth: 1)
        })
        .padding(.trailing, 8)
      
      VStack(alignment: .leading) {
        HStack {
          Text(name)
            .font(.system(size: 24))
            .fontWeight(.semibold)
        }
        
        if let points {
          HStack {
            Text("\(points)")
            Text(points == 1 ? "point" : "points")
          } //: HSTACK
        } //: IF
      } //: VSTACK
    } //: HSTACK
  } //: BODY
}

// MARK: - PREVIEW
struct PlayerView_Previews: PreviewProvider {
  static var previews: some View {
    PlayerView(name: "Alice", avatar: "person.circle.fill", avatarColor: .red)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
