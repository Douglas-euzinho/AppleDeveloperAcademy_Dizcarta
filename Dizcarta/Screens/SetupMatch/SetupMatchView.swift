//
//  NewPlayerView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 06/10/22.
//

import SwiftUI

struct SetupMatchView: View {
    // MARK: - VARIABLES
    @EnvironmentObject var router: Router
    @State var isAlertHiden: Bool = false
    @State var nameTextField: String = ""
    @ObservedObject private var gameCore: GameCore = GameCore(context: PersistenceController.context, cardFile: "cards")
    var body: some View {
        GeometryReader { geometry in
                ZStack {
                    Color(.backgroundAppColor)
                        .ignoresSafeArea(.all)
                    VStack {
                        HStack {
                            Text("Jogadores\nselecionados:")
                                .lineLimit(2, reservesSpace: true)
                                .font(.system(size: 30, weight: .light))
                                .padding(.leading)
                            
                            Spacer(minLength: 30)
                            
                            Text(String(format: "%02d", gameCore.players.count))
                                .font(Font.custom("DINCondensed-Bold", size: 100.0, relativeTo: .title2))
                                .foregroundColor(Color(.textPlayersCount))
                                .padding(.trailing)
                                .padding(.top)
                        } //: HStack
                        DotDividerView()
                            .frame(height: 3)
                        
                        VStack {
                            ScrollView(.vertical, showsIndicators: false) {
                                ForEach(gameCore.players.sorted(by: {$0.turn < $1.turn }), id: \.self) { player in
                                    PlayerSelectedView(player: player) {
                                        gameCore.repository.save()
                                    }
                                    .frame(width: geometry.size.width, height: 60)
                                }
                                .onTapGesture {
                                    self.isAlertHiden.toggle()
                                }
                                if isAlertHiden {
//                                    AlertCustomView(nameTextField: $nameTextField)
                                }
                            } //: ScrollView
                            .padding(.top, -34)
                            .padding(.bottom, -7)
                        } //: VStack
                        
                        VStack {
                          Color(.playerListColor)
                                .ignoresSafeArea(.all)
                                .overlay {
                                    VStack {
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            LazyHStack(spacing: 0) {
                                                ForEach(gameCore.avatarData, id: \.id) { avatar in
                                                    Avatar(avatar: avatar.image, name: avatar.name, isSelection: true) {
                                                        if let player = gameCore.players.first(where: {$0.wrappedAvatar == avatar.image}) {
                                                            gameCore.repository.delete(object: player)
                                                            gameCore.fetchPlayers()
                                                        }
                                                    } createAction: {
                                                        self.gameCore.createPlayer(name: avatar.name,
                                                                                   avatar: avatar.image)
                                                    }
                                                    .environmentObject(gameCore)
                                                } //: For
                                            } //: LazyHStack
                                        } //: ScrollView
                                        Text("Jogadores: mínimo 4, máximo 6.")
                                            .font(Font.custom("DINAlternate-Bold", size: 12.0, relativeTo: .title2))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(Color(.textPlayersCount))
                                            .padding(.vertical, 8)
                                        
                                        Button {
                                            HapticManager.send(style: .heavy)
                                            router.gameCore.nextPlayer()
                                            router.pushView(screen: .shiftPlayer)
                                        } label: {
                                            NeonButton(text: "Iniciar", image: .newButtonStyle)
                                                .opacity(gameCore.players.count < 4 ? 0.5 : 1.0)
                                                .frame(width: geometry.size.width / 1.5, height: geometry.size.height / 10)
                                        }
                                        .disabled(gameCore.players.count < 4)
                                    } //: VStack
                                } //: Overlay
                        } //: VStack
                        .frame(height: geometry.size.height / 3.2)
                    } //: VStack
                    .scrollDismissesKeyboard(.never)
                } //: ZStack
            .opacity(isAlertHiden ? 0.5 : 1)
            .ignoresSafeArea(.keyboard)
            .onAppear {
                gameCore.repository.removeAllMatchesInProgress()
                gameCore.repository.createMatch()
                router.gameCore = gameCore
            }
        } //: GeometryReader
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
                router.popView()
            }
        )
    } //: Body
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
