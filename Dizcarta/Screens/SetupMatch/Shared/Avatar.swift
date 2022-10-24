//
//  Avatar.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 06/10/22.
//

import SwiftUI

struct Avatar: View {
    // MARK: - PROPERTIES
    @State var isPressed: Bool = false
    @State var avatar: String
    @State var name: String
    var isSelection: Bool
    @EnvironmentObject var gameCore: GameCore
    // MARK: - BODY
    var body: some View {
        ZStack {
            HStack {
                Image(avatar)
                    .padding(isSelection ? -10 : 20)
                    .opacity(0.5)
                    .onTapGesture {
                        self.gameCore.createPlayer(name: name, avatar: avatar, match: MatchInProgress())
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
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
