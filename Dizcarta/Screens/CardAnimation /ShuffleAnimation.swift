//
//  ShuffleAnimation.swift
//  Dizcarta
//
//  Created by Victor Brito on 17/10/22.
//

import SwiftUI
import Lottie

struct ShuffleAnimation: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var gameCore: GameCore
    @State var showInGame = false
    @State var card: CardCodable!
    var body: some View {
        GeometryReader { geometry in
                NavigationStack {
                    ZStack {
                        Color(.backgroundAppColor)
                            .ignoresSafeArea()
                        VStack {
                            LottieView(animationName: "ShuffleAnimation.json", loopMode: .repeat(1)) {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    showInGame = true
                                }
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height)
                        }
                        .navigationDestination(isPresented: $showInGame, destination: {
                            InGameView(card: card)
                            .environmentObject(gameCore)                            })
                    }
                    .onAppear {
                        self.card = gameCore.getRandomCard()
                    }
                }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationLink(destination: HomeView()) {
                    GenericFunctions.checkIfImageExist(name: "exitButton")
                        .onTapGesture {
                            gameCore.resetMatch()
                            showInGame = true
                        }
                }
            }
        }
    }
    
}

struct ShuffleAnimation_Previews: PreviewProvider {
    static var previews: some View {
        let devices = [ "iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
        
        ForEach(devices, id: \.self) { device in
            ShuffleAnimation()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
