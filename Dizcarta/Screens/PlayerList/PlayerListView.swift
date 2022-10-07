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
    @State var playerName = ""
    @State var avatarIcon = ""
    @StateObject var observed = Observed(context: PersistenceController.context)
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ZStack {
                Color(.playerListColor)
                    .ignoresSafeArea()
                if observed.players.isEmpty {
                    VStack {
                        Button {
                            showingPopup = true
                        } label: {
                            Image("AddPlayer")
                        }
                        Text("Adicione jogadores para começar a jogar.")
                            .foregroundColor(Color.white)
                    }
                } else {
                    VStack(alignment: .leading) {
                        ForEach(observed.players.reversed()) { player in
                            PlayerView(name: player.name ?? "", avatar: avatarIcon)
                                .padding()
                            Divider()
                        }
                    }
                    Spacer()
                }
                // TODO: - TROCAR A ALERT VIEW POR UM POPOVER
                AlertView(isActive: $showingPopup) {
                    InputPlayerView(text: $playerName, selectedAvatar: $avatarIcon) {
                        observed.createPlayer(name: playerName, avatar: avatarIcon, match: observed.matchInProgress)
                        playerName = ""
                        showingPopup = false
                        observed.fetchPlayers()
                    } cancelAction: {
                        showingPopup = false
                        playerName = ""
                    }
                }
            }
        } //: VSTACK
        .navigationTitle("Jogadores")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)

        .navigationBarItems(leading:
                                HStack {
            Image(systemName: "chevron.left")
            Text("Voltar")
                .fontWeight(.medium)
        }
            .foregroundColor(.white)
            .onTapGesture {
                self.presentation.wrappedValue.dismiss()
                self.observed.resetMatch()
            }
        )
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if !observed.players.isEmpty && observed.players.count < 6  && !showingPopup {
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
