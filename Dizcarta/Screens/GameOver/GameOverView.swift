//
//  GameOverView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 29/09/22.
//

import SwiftUI

struct GameOverView: View {
    // MARK: - VARIABLES
    @EnvironmentObject var gameCore: GameCore
    @State private var newGame = false
    @State private var players = [Player]()
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Color(.backgroundAppColor)
                        .ignoresSafeArea(.all)
                    
                        VStack {
                            Text("Fim de Jogo!")
                                .font(.system(size: 34))
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                .padding(.vertical, 30)
                            
                          ScrollView(.vertical, showsIndicators: true) {
                            VStack {
                                PlayerGameOver(name: gameCore.getRanking()[0].wrappedName,
                                               avatarAsset: gameCore.getRanking()[0].wrappedAvatar,
                                               points: gameCore.getRanking()[0].wrappedPoints,
                                               podiumPosition: 1)
                                .padding(.bottom, 20)
                                
                                HStack(spacing: 60) {
                                    PlayerGameOver(name: gameCore.getRanking()[1].wrappedName,
                                                   avatarAsset: gameCore.getRanking()[1].wrappedAvatar,
                                                   points: gameCore.getRanking()[1].wrappedPoints,
                                                   podiumPosition: 2)
                                    
                                    PlayerGameOver(name: gameCore.getRanking()[2].wrappedName,
                                                   avatarAsset: gameCore.getRanking()[2].wrappedAvatar,
                                                   points: gameCore.getRanking()[2].wrappedPoints,
                                                   podiumPosition: 3)
                                }
                                
                                ForEach(players, id: \.self) { player in
                                    PlayerGameOver(name: player.wrappedName,
                                                   avatarAsset: player.wrappedAvatar,
                                                   points: player.wrappedPoints,
                                                   podiumPosition: (players.firstIndex(of: player) ?? 0) + 4)
                                    .padding()
                                }
                            }
                            
                            Spacer()
                            
                            Button {
                                newGame = true
                            } label: {
                                NeonButton(text: "Novo Jogo", image: .neonButtonYellow)
                                    .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 7)
                                    .shadow(radius: 5)
                                    .padding(20)
                            }
                            .hapticFeedback(feedbackStyle: .heavy)
                        }
                    }
                    .navigationBarBackButtonHidden(true)
                    .navigationDestination(isPresented: $newGame) {
                        SetupMatchView()
                    }
                }
            }
        }
        .onAppear {
            players = gameCore.getRanking()
            players.removeSubrange(0...2)
        }
        .onDisappear {
            gameCore.resetMatch()
        }
        //: VSTACK
    }
}

// MARK: - PREVIEW
// struct GameOverView_Previews: PreviewProvider {
//  static var previews: some View {
//    let devices = ["iPhone SE (3rd generation)","iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
//
//    ForEach(devices, id: \.self) { device in
//      GameOverView()
//        .previewDevice(PreviewDevice(rawValue: device))
//        .previewDisplayName(device)
//    }
//  }
// }
