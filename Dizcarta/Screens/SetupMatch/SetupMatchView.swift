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
    @StateObject private var gameCore: GameCore = GameCore(context: PersistenceController.context, cardFile: "cards")
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
                        
                        if !gameCore.players.isEmpty {
                            ScrollView(.vertical, showsIndicators: false) {
                                ForEach(gameCore.players.sorted(by: {$0.turn < $1.turn }), id: \.self) { player in
                                    PlayerSelectedView(player: player) {
                                        gameCore.repository.save()
                                    } deleteAction: {
                                        gameCore.players.removeAll(where: {$0.wrappedName == player.wrappedName })
                                        gameCore.repository.delete(object: player)
                                    }
                                    .frame(width: UIScreen.main.bounds.width - 5, height: 85)
                                }
                            }
                        } else {
                            Spacer(minLength: geometry.size.height / 3.7)
                            
                            Text("Adicione pelo menos quatro jogadores para" + "\ncomeçar a jogar.")
                                .font(Font.custom("DINAlternate-Bold", size: 15))
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(height: geometry.size.height / 10)
                                .padding(.horizontal, 15)
                            
                            Spacer(minLength: geometry.size.height / 3.7)
                        }
                        if gameCore.players.count < 4 {
                            NeonButton(text: "Jogar", image: .neonButtonYellow)
                                .hapticFeedback(feedbackStyle: .heavy)
                                .opacity(0.5)
                                .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 7)
                        } else {
                            NavigationLink(destination: ShiftPlayerView().environmentObject(gameCore)) {
                                NeonButton(text: "Jogar", image: .neonButtonYellow)
                                    .hapticFeedback(feedbackStyle: .heavy)
                                    .opacity(1.0)
                                    .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 7)
                            }
                        }
                    } //: VSTACK
                    .ignoresSafeArea(.keyboard)
                    .navigationDestination(isPresented: $backHome) {
                        HomeView()
                    }
                }
                .ignoresSafeArea(.keyboard)
            }
        }
        .navigationBarTitle("Jogadores")
        .tint(.white)
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
