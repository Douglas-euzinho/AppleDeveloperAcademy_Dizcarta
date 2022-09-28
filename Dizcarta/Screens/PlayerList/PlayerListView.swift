//
//  PlayerListView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 21/09/22.
//

import SwiftUI

struct PlayerListView: View {
  // MARK: - VARIABLES
  @Environment(\.presentationMode) var presentation
  @State var showingPopup = false
  
  // MARK: - BODY
  var body: some View {
    HStack {
      VStack {
        Button {
          showingPopup = true
        } label: {
          Image("AddPlayer")
            .resizable()
            .frame(width: 64, height: 64)
        }
        .popover(isPresented: $showingPopup) {
          PickColorView()
        }
        
        Text("Adicione jogadores para começar a jogar.")
      } //: VSTACK
    } //: HSTACK
    .navigationTitle("Jogadores")
    .navigationBarTitleDisplayMode(.large)
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading:
      HStack {
        Image(systemName: "chevron.left")
        Text("Voltar")
          .fontWeight(.medium)
      }
      .foregroundColor(.black)
      .onTapGesture {
        self.presentation.wrappedValue.dismiss()
      }
    )
  } //: BODY
}

// MARK: - PREVIEW
struct PlayerListView_Previews: PreviewProvider {
  static var previews: some View {
    PlayerListView()
  }
}
