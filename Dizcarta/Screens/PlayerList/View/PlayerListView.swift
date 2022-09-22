//
//  PlayerListView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 21/09/22.
//

import SwiftUI

struct PlayerListView: View {
    var body: some View {
      HStack {
        VStack {
          Button {
            
          } label: {
            Image("AddPlayer")
              .resizable()
              .frame(width: 64, height: 64)
        }
          Text("Adicione jogadores para começar a jogar.")
        }
      }
      .navigationTitle("Jogadores")
      .navigationBarTitleDisplayMode(.large)
    }
}

struct PlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView()
    }
}
