//
//  Avatar.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 06/10/22.
//

import SwiftUI

struct Avatar: View {
  // MARK: - PROPERTIES
  @State private var isPressed: Bool = false
  @State var avatar: String
  @State var name: String
  @State private var changeOpacity: Bool = false
  var isSelection: Bool
  
  @EnvironmentObject var gameCore: GameCore
  
  // MARK: - BODY
  var body: some View {
    ZStack {
      HStack {
        Image(avatar)
          .padding(isSelection ? -10 : 20)
          .opacity(changeOpacity ? 1.0 : 0.5)
          .onTapGesture {
            if !isPressed {
              self.gameCore.createPlayer(name: name, avatar: avatar, match: MatchInProgress())
              self.isPressed = true
              self.changeOpacity = true
            }
          }
          .background {
            if isPressed {
              Image("BackgroundSelectedPlayer")
            }
          }
          .overlay {
            if isPressed {
              ZStack(alignment: .bottomTrailing) {
                Image("BackgroundSelectedPlayer")
                  .opacity(0.0)
                Image("removePlayer")
                  .onTapGesture {
                    // TODO: PUT THE REMOVE PLAYER FROM LIST HERE
                    self.isPressed = false
                    self.changeOpacity = false
                  }
              }
            }
          }
        
        if !isSelection {
          Text(name)
            .font(.system(size: 24, weight: .semibold))
        }
      }
    }
  }
}

// MARK: - BODY
struct Avatar_Previews: PreviewProvider {
  static var previews: some View {
    Avatar(avatar: "avatarRed", name: "Alice", isSelection: true)
      .preferredColorScheme(.light)
      .previewLayout(.sizeThatFits)
  }
}
