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
    @ObservedObject var player: Player
    @State private var backupName: String = ""
    var saveAction: () -> Void = {}
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { _ in
            HStack {
                GenericFunctions.checkIfImageExist(name: player.wrappedAvatar)
                    .resizable()
                    .frame(width: 112, height: 112)
                    .opacity(1.0)
                
                if isEditing {
                    TextField("", text: $player.wrappedName)
                        .foregroundColor(.white)
                        .font(Font(name: .primaryFont, size: 20))
                        .textInputAutocapitalization(.words)
                        .autocorrectionDisabled(true)
                        .focused($nameIsFocused)
                        .modifier(TextFieldClearButton(text: $player.wrappedName))
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
                    TextField("", text: $player.wrappedName)
                        .foregroundColor(.white)
                        .font(Font.custom("DINAlternate-Bold", size: 20))
                        .disabled(!isEditing)
                }
                
                Button {
                    self.isEditing.toggle()
                } label: {
                    if isEditing {
                        GenericFunctions.checkIfImageExist(name: "checkmark")
                            .frame(width: 22, height: 18)
                            .padding()
                            .onTapGesture {
                                if player.wrappedName == "" {
                                    player.wrappedName = backupName
                                }
                                saveAction()
                                self.isEditing.toggle()
                            }
                        
                    } else {
                        GenericFunctions.checkIfImageExist(name: "ChangeNamePencil")
                            .resizable()
                            .frame(width: 70, height: 70)
                    }
                }
            }
            .onAppear {
                backupName = player.wrappedName
            }
        }
    }
}

// MARK: - PREVIEW
// struct PlayerSelectedView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerSelectedView(player: Player()) {
//            print("Hello World")
//        }
//            .preferredColorScheme(.dark)
//    }
// }
