//
//  PlayerSelectedView.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 07/10/22.
//

import SwiftUI

struct PlayerSelectedView: View {
    var imagePlayer: String
    
    @State var isEditing: Bool?
    @State var playerName: String
    
    init(imagePlayer: String, playerName: String) {
        self.imagePlayer = imagePlayer
        self.playerName = playerName
        self.isEditing = false
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                GenericFunctions.checkIfImageExist(name: imagePlayer)
                    .resizable()
                    .frame(width: 70, height: 70)
                Spacer()
                Text(playerName)
                    .font(Font.custom("DINAlternate-Bold", size: 24))

                Spacer()
                GenericFunctions.checkIfImageExist(name: "ChangeNamePencil")
                    .resizable()
                    .frame(width: 70, height: 70)
            }
            .frame(width: geometry.size.width)
        }
    }
}

struct PlayerSelectedView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerSelectedView(imagePlayer: "FaceHappy", playerName: "vito")
    }
}
