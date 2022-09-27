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
    @State var players = [Player]()
    @StateObject var observed = Observed(context: PersistenceController.shared.container.viewContext)
    
    // MARK: - BODY
    var body: some View {
        HStack {
            VStack {
                if players.isEmpty {
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
                        ForEach(players.reversed()) { player in
                            PlayerView(name: player.name ?? "", points: Int(player.points))
                                .padding()
                            Divider()
                        }
                    }
                    Spacer()
                }
            } //: VSTACK
        } //: HSTACK
        .onAppear {
            players = observed.repository.getPlayers()
        }
        .popover(isPresented: $showingPopup) {
            InputPlayerView(text: $playerName, selectedColor: $playerColor) {
                observed.repository.createPlayer(name: playerName, color: "Color Name")
            }
            .onDisappear {
                players = observed.repository.getPlayers()
            }
        }
        .navigationTitle("Jogadores")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if !players.isEmpty {
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
