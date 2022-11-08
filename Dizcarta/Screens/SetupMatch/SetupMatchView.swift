//
//  NewPlayerView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 06/10/22.
//

import SwiftUI

struct SetupMatchView: View {
  // MARK: - VARIABLES
  @Environment(\.presentationMode) var presentation
  @State var nameTextField: String = ""
  @State var backHome = false
  @State private var goToShiftPlayer = false
  @ObservedObject private var gameCore: GameCore = GameCore(context: PersistenceController.context, cardFile: "cards")
  
  // MARK: - BODY
  var body: some View {
    GeometryReader { geometry in
      NavigationStack {
        ZStack {
          Color(.backgroundAppColor)
            .ignoresSafeArea()
          
          VStack(spacing: 15) {
            HStack {
              Text("Jogadores\nselecionados:")
                .lineLimit(2, reservesSpace: true)
                .font(.system(size: 30, weight: .light))
                .padding(.leading)
              
              Spacer(minLength: 30)
              
              Text(String(format: "%02d", gameCore.players.count))
                .font(Font.custom("DINCondensed-Bold", size: 100))
                .foregroundColor(Color(.textPlayersCount))
                .padding(.trailing)
                .padding(.top)
            }
            .padding(.top, 10)
            
            DotDividerView()
              .frame(height: 3)
            
            ScrollView(.vertical, showsIndicators: false) {
              ForEach(gameCore.players.sorted(by: {$0.turn < $1.turn }), id: \.self) { player in
                PlayerSelectedView(player: player) {
                  gameCore.repository.save()
                }
                .frame(width: geometry.size.width, height: 60)
              }
            }
            .padding(.top, -34)
            .padding(.bottom, -7)
            
            ZStack {
              Color(.playerListBackgroundColor)
                    .ignoresSafeArea(.all)
              
              VStack {
                  ScrollView(.horizontal, showsIndicators: false) {
                    ZStack {
                      LazyHStack(spacing: 0) {
                          ForEach(gameCore.avatarData, id: \.id) { avatar in
                              Avatar(avatar: avatar.image, name: avatar.name, isSelection: true) {
                                  if let player = gameCore.players.first(where: {$0.wrappedAvatar == avatar.image}) {
                                      gameCore.repository.delete(object: player)
                                      gameCore.fetchPlayers()
                                  }
                              } createAction: {
                                  self.gameCore.createPlayer(name: avatar.name, avatar: avatar.image, match: MatchInProgress())
                              }
                            .environmentObject(gameCore)
                        } //: FOREACH
                      } //: LAZYHSTACK
                    } //: ZSTACK
                  } //: SCROLL VIEW
                Text("Jogadores: mínimo 4, máximo 6.")
                  .font(Font.custom("DINAlternate-Bold", size: 12))
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(.textPlayersCount))
                  .padding(.vertical, 8)
                
                Button {
                  goToShiftPlayer = true
                    HapticManager.send(style: .heavy)
                } label: {
                  NeonButton(text: "Iniciar", image: .neonButtonYellow)
                    .opacity(gameCore.players.count < 4 ? 0.5 : 1.0)
                    .frame(width: geometry.size.width / 1.8, height: geometry.size.height / 15)
                }
                .disabled(gameCore.players.count < 4)
              } //: VSTACK
            }
            .frame(height: geometry.size.height / 4)
          }
          .scrollDismissesKeyboard(.interactively)
        } //: VSTACK
      .navigationDestination(isPresented: $backHome) {
        HomeView()
      }
      .navigationDestination(isPresented: $goToShiftPlayer) {
        ShiftPlayerView()
          .environmentObject(gameCore)
      }
    }
      .ignoresSafeArea(.keyboard)
    .onAppear {
      gameCore.matchInProgress = gameCore.createMatch()
    }
  }
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading:
                          HStack {
      Image(systemName: "chevron.left")
      Text("Voltar")
        .fontWeight(.medium)
    }
      .foregroundColor(.white)
      .onTapGesture {
        gameCore.resetMatch()
        backHome = true
      }
    )
}

  func removePlayers(at offsets: IndexSet) {
    gameCore.players.remove(atOffsets: offsets)
  }
}

// MARK: - PREVIEW
// struct NewPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        let devices = ["iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
//        ForEach(devices, id: \.self) { device in
//            SetupMatchView()
//                .previewDevice(PreviewDevice(rawValue: device))
//                .previewDisplayName(device)
//        }
//    }
// }
