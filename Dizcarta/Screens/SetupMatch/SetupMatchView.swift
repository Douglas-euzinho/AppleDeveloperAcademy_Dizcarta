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
  
  init() {
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    UITableView.appearance().separatorStyle = .none
    UITableViewCell.appearance().backgroundColor = UIColor(Color.clear)
    UITableView.appearance().backgroundColor = UIColor(Color.clear)
  }
  
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
            }
            .padding(.top, 10)
            
            DotDividerView()
              .frame(height: 3)
            
            ScrollView(.vertical, showsIndicators: false) {
              ForEach(gameCore.players.sorted(by: {$0.turn < $1.turn }), id: \.self) { player in
                PlayerSelectedView(player: player) {
                  gameCore.repository.save()
                } deleteAction: {
                  gameCore.players.removeAll(where: {$0.wrappedName == player.wrappedName })
                  gameCore.repository.delete(object: player)
                }
                .frame(width: UIScreen.main.bounds.width - 5, height: 55)
              }
            }
            .padding(.top, -34)
            .padding(.bottom, -7)
            
            ZStack {
              Color(.playerListBackgroundColor)
                .ignoresSafeArea(.all)
              
              VStack {
                if !gameCore.avatarDataList.isEmpty {
                  ScrollView(.horizontal, showsIndicators: false) {
                    ZStack {
                      LazyHStack(spacing: 0) {
                        ForEach(gameCore.avatarDataList, id: \.id) { avatar in
                          Avatar(avatar: avatar.image, name: avatar.name, isSelection: true)
                            .environmentObject(gameCore)
                        } //: FOREACH
                      } //: LAZYHSTACK
                    } //: ZSTACK
                  } //: SCROLL VIEW
                  .frame(height: 100)
                }
                
                Text("Jogadores: mínimo 4, máximo 6.")
                  .font(Font.custom("DINAlternate-Bold", size: 12))
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(.textPlayersCount))
                  .padding(.horizontal, 15)
                
                Button {
                  goToShiftPlayer = true
                } label: {
                  NeonButton(text: "Jogar", image: .neonButtonYellow)
                    .opacity(gameCore.players.count < 4 ? 0.5 : 1.0)
                    .frame(width: geometry.size.width / 1.6, height: geometry.size.height / 10)
                }
                .disabled(gameCore.players.count < 4)
                .hapticFeedback(feedbackStyle: .heavy)
              } //: VSTACK
            }
            .frame(height: geometry.size.height / 4)
          }
        } //: VSTACK
      .ignoresSafeArea(.keyboard)
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
