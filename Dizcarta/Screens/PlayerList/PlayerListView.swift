//
//  PlayerListView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 21/09/22.
//

import SwiftUI

struct PlayerListView: View {
    
    // MARK: - VARIABLES
    @State var showingPopup = false
    @State var playerName = ""
    @State var playerColor: Color = .avatarColorBlue
    @StateObject var observed = Observed(context: PersistenceController.context)
    
    // MARK: - BODY
    var body: some View {
        HStack {
            VStack {
                if observed.repository.players.isEmpty {
                    Button {
                        showingPopup = true
                    } label: {
                        Image("AddPlayer")
                            .resizable()
                            .frame(width: 64, height: 64)
                    }
                    Text("Adicione jogadores para começar a jogar.")
                } else {
                    VStack(alignment: .leading) {
                        ForEach(observed.repository.players.reversed()) { player in
                            PlayerView(name: player.name ?? "", points: Int(player.points))
                                .padding()
                            Divider()
                        }
                    }
                    Spacer()
                }
            } //: VSTACK
        } //: HSTACK
        .popover(isPresented: $showingPopup) {
            InputPlayerView(text: $playerName, selectedColor: $playerColor) {
                observed.repository.createPlayer(name: playerName, color: "Color Name")
            }
        }
        .navigationTitle("Jogadores")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if !observed.repository.players.isEmpty {
                    Button {
                        showingPopup = true
                    } label: {
                        Image("AddPlayer")
                            .resizable()
                            .frame(width: 36, height: 36)
                    }
                } else {
                    EmptyView()
                }
            }
        }
    } //: BODY
}

// MARK: - PREVIEW
struct PlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView()
    }
}
