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
                        
                        VStack {
                            PlayerGameOver(name: gameCore.top3Players[0].wrappedName,
                                           avatarAsset: gameCore.top3Players[0].wrappedAvatar, podiumPosition: 1,
                                           points: gameCore.top3Players[0].wrappedPoints)
                                .padding(.bottom, 20)
                            
                            HStack(spacing: 60) {
                                PlayerGameOver(name: gameCore.top3Players[1].wrappedName,
                                               avatarAsset: gameCore.top3Players[1].wrappedAvatar,
                                               podiumPosition: 2,
                                               points: gameCore.top3Players[1].wrappedPoints)
                                PlayerGameOver(name: gameCore.top3Players[2].wrappedName,
                                               avatarAsset: gameCore.top3Players[2].wrappedAvatar,
                                               podiumPosition: 3,
                                               points: gameCore.top3Players[2].wrappedPoints)
                            }
                            
                        }
                        
                        Spacer()
                        
                        NeonButton(text: "Novo Jogo", image: .neonButtonYellow)
                            .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 7)
                            .shadow(radius: 5)
                            .padding(20)
                            .onTapGesture {
                                newGame = true
                                gameCore.resetMatch()
                            }
                    }
                }
                .navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $newGame) {
                    SetupMatchView()
            }
            }
        }
        //: VSTACK
    }
}

// MARK: - PREVIEW
struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        let devices = ["iPhone SE (3rd generation)","iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
        
        ForEach(devices, id: \.self) { device in
            GameOverView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
