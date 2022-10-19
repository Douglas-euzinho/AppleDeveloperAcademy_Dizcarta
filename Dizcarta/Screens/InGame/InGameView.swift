//
//  InGameView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 22/09/22.
//

import SwiftUI

struct InGameView: View {
    // MARK: - VARIABLES
    @Environment(\.presentationMode) var presentation
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var gameCore: GameCore
    @State var nextPlayer = false
    @State var backToHome = false
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false
    let durationAndDelay : CGFloat = 0.3
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.backgroundAppColor)
                    .ignoresSafeArea(.all)
                VStack {
                    ZStack {
                        FrontCard(title: .constant("Doente de Amor"),
                                  description: .constant("Você deve ficar de mãos dadas com a pessoa a sua esquerda enquanto joga."),
                                  acceptPoints: .constant(4),
                                  declinePoints: .constant(4),
                                  degree: $frontDegree)
                        BackCard(degree: $backDegree)
                    }.onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
                            flipCard()
                        }
                    })
                    .padding(.top, 50)
                    
                    HStack {
                        ButtonCardView(iconName: "ButtonAccept", text: "Aceitar", backgroundImage: "acceptButton")
                            .frame(width: 180, height: 100)
                            .onTapGesture {
                                gameCore.addPlayerPoints(player: gameCore.playerPlaying!, points: 3)
                                nextPlayer = true
                            }
                        
                        ButtonCardView(iconName: "ButtonRefuse", text: "Recusar", backgroundImage: "refuseButton")
                            .frame(width: 180, height: 100)
                            .onTapGesture {
                                gameCore.removePlayerPoints(player: gameCore.playerPlaying!, points: 5)
                                nextPlayer = true
                            }
                    } //: HSTACK
                    .padding(.bottom, 30)
                } //: VSTACK
                .navigationDestination(isPresented: $backToHome) {
                    HomeView()
                }
                .navigationDestination(isPresented: $nextPlayer) {
                    ShiftPlayerView()
                        .environmentObject(gameCore)
                }
            } //: ZSTACK
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: HomeView()) {
                        GenericFunctions.checkIfImageExist(name: "exitButton")
                            .onTapGesture {
                                gameCore.resetMatch()
                                backToHome = true
                            }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    PlayerView(name: gameCore.playerPlaying?.wrappedName ?? "",
                               avatar: gameCore.playerPlaying?.wrappedAvatar ?? "",
                               points: gameCore.playerPlaying?.wrappedPoints)
                }
        }
        }
    }
    
    // MARK: - FLIP CARD
    private func flipCard() {
        isFlipped.toggle()
        
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                backDegree = 0
            }
        }
    }
}

// MARK: - PREVIEW
struct InGameView_Previews: PreviewProvider {
    static var previews: some View {
        let devices = ["iPhone SE (3rd generation)","iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
        
        ForEach(devices, id: \.self) { device in
            InGameView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
