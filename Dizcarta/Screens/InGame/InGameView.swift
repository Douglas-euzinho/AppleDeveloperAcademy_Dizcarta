//
//  InGameView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 22/09/22.
//

import SwiftUI

struct InGameView: View {
    // MARK: - VARIABLES
    @State var animationPresented = false
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false
    @State var isButtonHiden = true
    let durationAndDelay : CGFloat = 0.3
    @EnvironmentObject var router: Router
    private var isSpecialCard: Bool {
        router.gameCore.selectedCard?.type != .challenge
    }
    // MARK: - BODY
    var body: some View {
        GeometryReader { _ in
            ZStack {
                Color(.backgroundAppColor)
                    .ignoresSafeArea(.all)
                VStack {
                    ZStack {
                        FrontCard(title: router.gameCore.selectedCard?.title ?? "",
                                  description: router.gameCore.selectedCard?.dizDescription ?? "",
                                  acceptPoints: router.gameCore.selectedCard?.winPoints ?? 0,
                                  declinePoints: router.gameCore.selectedCard?.losePoints ?? 0,
                                  cardType: router.gameCore.selectedCard?.type ?? .challenge,
                                  degree: $frontDegree)
                        BackCard(degree: $backDegree,
                                 cardImage: getBackgroundCardAsset(type: router.gameCore.selectedCard?.type ?? .challenge))
                    }.onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
                            flipCard()
                            delayButton()
                        }
                    })
                    .padding(.top, 50)
                    // MARK: BUTTONS ACCEPT AND REFUSE
                    HStack {
                        if (!isSpecialCard) {
                            ButtonCardView(iconName: "ButtonRefuse", text: "Recusar", backgroundImage: "refuseButton")
                                .onTapGesture {
                                    refuseAction()
                                }
                            
                            ButtonCardView(iconName: "ButtonAccept", text: "Aceitar", backgroundImage: "acceptButton")
                                .onTapGesture {
                                   acceptAction()
                                }
                        } else {
                            ButtonCardView(iconName: cardType == .surprise ? "happyAccept" : "sadAccept",
                                           text: cardType == .surprise ? "Receber" : "Ok",
                                           backgroundImage: "secondaryButton")
                            .onTapGesture {
                                specialAction()
                            }
                        }
                        
                    }//: HSTACK
                    .padding(.bottom, 30)
                    .opacity(isButtonHiden  ? 0 : 1)
                    
                } //: VSTACK
                
            } //: ZSTACK
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    PlayerView(avatar: router.gameCore.playerPlaying?.wrappedAvatar ?? "",
                               name: router.gameCore.playerPlaying?.wrappedName ?? "",
                               points: router.gameCore.playerPlaying?.wrappedPoints ?? 0)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        HapticManager.send(style: .heavy)
                        isFlipped.toggle()
                        router.pushView(screen: .gamePaused)
                    } label: {
                        GenericFunctions.checkIfImageExist(name: "pauseButton")
                    }
                }
            }
        }
    }
    
    private func getBackgroundCardAsset(type: CardType) -> String {
        switch type {
        case .challenge:
            return "challengeCard"
        case .surprise:
            return "surpriseCard"
        case .loss:
            return "prankCard"
        }
    }
    
    private func acceptAction() {
        router.gameCore.addPlayerPoints(player: router.gameCore.playerPlaying!,
                                        points: router.gameCore.selectedCard?.winPoints ?? 0)
        
        router.gameCore.acceptOrRefuseMessage = (router.gameCore.selectedCard?.winPoints ?? 0 > 1) ?
        "Você ganhou \(router.gameCore.selectedCard?.winPoints ?? 0) pontos." :
        "Você ganhou \(router.gameCore.selectedCard?.winPoints ?? 0) ponto."
        router.gameCore.acceptOrRefuseTitle = "Parabéns"
        
        router.pushView(screen: .acceptRefuse)
    }
    
    private func refuseAction() {
        router.gameCore.removePlayerPoints(player: router.gameCore.playerPlaying!,
                                           points: router.gameCore.selectedCard?.losePoints ?? 0)
        
        router.gameCore.acceptOrRefuseMessage = (router.gameCore.selectedCard?.losePoints ?? 0 > 1) ?
        "Você perdeu \(router.gameCore.selectedCard?.losePoints ?? 0) pontos." :
        "Você perdeu \(router.gameCore.selectedCard?.losePoints ?? 0) ponto."
        router.gameCore.acceptOrRefuseTitle = "Que pena"
        
        router.pushView(screen: .acceptRefuse)
    }
    
    private func specialAction() {
        switch cardType {
        case .surprise:
            acceptAction()
        case .loss:
            refuseAction()
        default:
            break
        }
    }
    
    private func delayButton() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
            isButtonHiden.toggle()
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

extension InGameView {
    
    private var cardType: CardType {
        router.gameCore.selectedCard?.type ?? .challenge
    }
    
}
//
// MARK: - PREVIEW
// struct InGameView_Previews: PreviewProvider {
//    static var previews: some View {
//        let devices = ["iPhone SE (3rd generation)","iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
//
//        ForEach(devices, id: \.self) { device in
//            InGameView()
//                .previewDevice(PreviewDevice(rawValue: device))
//                .previewDisplayName(device)
//        }
//    }
// }
