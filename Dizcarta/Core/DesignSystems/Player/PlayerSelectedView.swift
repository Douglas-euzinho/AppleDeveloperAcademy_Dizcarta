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
  @FocusState var nameIsFocused: FocusedField?
  @ObservedObject var player: Player
  @ObservedObject var gameCore: GameCore
  @State private var backupName: String = ""
  var saveAction: () -> Void
  enum FocusedField {
    case username
  }
  
  // MARK: - BODY
  var body: some View {
    GeometryReader { geometry in
      HStack {
        GenericFunctions.checkIfImageExist(name: player.wrappedAvatar)
          .resizable()
          .frame(width: 95, height: 95)
          .padding(.leading, 10)
          .padding(.trailing, -15)
          .opacity(1.0)
        
        if isEditing {
          TextField("", text: $player.wrappedName)
            .foregroundColor(.white)
            .font(Font(name: .dinAlternateBold, size: 20))
            .textInputAutocapitalization(.words)
            .autocorrectionDisabled(true)
            .focused($nameIsFocused, equals: .username)
            .modifier(TextFieldClearButton(text: $player.wrappedName))
            .padding(.vertical, 8)
            .task {
              self.nameIsFocused = .username
            }
            .onSubmit {
              save()
            }
            .onChange(of: nameIsFocused) { focused in
              if focused != .username {
                save()
              }
            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Image(player.wrappedAvatar)
                            .resizable()
                            .frame(width: 35, height: 35)
                        Text(player.wrappedName)
                            .padding(.leading, 2)
                    }
                }
            }
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
              .padding(20)
              .onTapGesture {
                save()
              }
          } else {
            Image(systemName: "pencil")
              .resizable()
              .frame(width: 16, height: 16)
              .padding(22)
              .foregroundColor(Color(.textPlayersCount))
          }
        }
      } //: HStack
      .background(
        HStack {
          RoundedRectangle(cornerRadius: 5)
            .foregroundColor(Color(.playerListBackgroundColor))
            .frame(width: geometry.size.width - 25, height: 40)
        }
      )
      .onAppear {
        backupName = player.wrappedName
      }
    }
  }
  private func save() {
      if gameCore.players.contains(where: { $0.wrappedName.lowercased() == player.wrappedName.lowercased()
          && $0.wrappedAvatar != player.wrappedAvatar }) {
          player.wrappedName = backupName
          return
      }
      
    if player.wrappedName.isBlank {
      player.wrappedName = backupName
    }
    saveAction()
    backupName = player.wrappedName
    self.isEditing.toggle()
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
