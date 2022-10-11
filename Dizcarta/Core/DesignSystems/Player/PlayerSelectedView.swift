//
//  PlayerSelectedView.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 07/10/22.
//

import SwiftUI

struct PlayerSelectedView: View {
    // MARK: - PROPERTIES
    @State var isEditing: Bool = false
    @FocusState var nameIsFocused: Bool
    @State var playerName: String
    var imagePlayer: String
    var backupName: String
    
    init(imagePlayer: String, playerName: String) {
        self.imagePlayer = imagePlayer
        self.playerName = playerName
        self.isEditing = false
        self.backupName = playerName
    }
    
    // MARK: - BODY
    var body: some View {
        HStack {
            GenericFunctions.checkIfImageExist(name: imagePlayer)
                .resizable()
                .frame(width: 112, height: 112)
                .opacity(1.0)
            
            if isEditing {
                TextField("", text: $playerName)
                    .foregroundColor(.white)
                    .font(Font(name: .primaryFont, size: 30))
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled(true)
                    .focused($nameIsFocused)
                    .modifier(TextFieldClearButton(text: $playerName))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(
                        HStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .opacity(0.5)
                        }
                    )
                
            } else {
                TextField("", text: $playerName)
                    .foregroundColor(.white)
                    .font(Font.custom("DINAlternate-Bold", size: 20))
            }
                        
            Button {
                self.isEditing.toggle()
            } label: {
                if isEditing {
                    Image(systemName: "checkmark")
                        .foregroundColor(.green)
                        .padding()
                        .onTapGesture {
                            if self.playerName == "" {
                                self.playerName = backupName
                            }
                            
                            self.isEditing.toggle()
                        }
                    
                } else {
                GenericFunctions.checkIfImageExist(name: "ChangeNamePencil")
                    .resizable()
                    .frame(width: 56, height: 56)
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct PlayerSelectedView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerSelectedView(imagePlayer: "avatarBlue", playerName: "Blue")
            .preferredColorScheme(.dark)
    }
}
