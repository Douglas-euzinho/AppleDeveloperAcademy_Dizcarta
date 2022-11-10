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
  @State var animationPresented = false
  @State var nextPlayer = false
  @State var backToHome = false
  @State var backDegree = 0.0
  @State var frontDegree = -90.0
  @State var isFlipped = false
  @State var isButtonHiden = true
  @State var card: CardCodable?
  @State private var message: String = ""
  @State private var title: String = ""
  let durationAndDelay : CGFloat = 0.3
  
  // MARK: - BODY
  var body: some View {
    GeometryReader { _ in
      NavigationStack {
        if animationPresented {
          ZStack {
            Color(.backgroundAppColor)
              .ignoresSafeArea(.all)
            VStack {
              ZStack {
                FrontCard(title: card?.title ?? "",
                          description: card?.dizDescription ?? "",
                          acceptPoints: card?.winPoints ?? 0,
                          declinePoints: card?.losePoints ?? 0,
                          cardType: card?.type ?? .challenge,
                          degree: $frontDegree)
                  BackCard(degree: $backDegree, cardImage: getBackgroundCardAsset(type: card?.type ?? .challenge))
              }.onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
                  flipCard()
                  delayButton()
                }
              })
              .padding(.top, 50)
              
              HStack {
                VStack {
                  ButtonCardView(iconName: "ButtonRefuse", text: "Recusar", backgroundImage: "refuseButton")
                    .onTapGesture {
                      gameCore.removePlayerPoints(player: gameCore.playerPlaying!, points: card?.losePoints ?? 0)
                      if (card?.losePoints ?? 0 > 1) {
                        message = "Você perdeu \(card?.losePoints ?? 0) pontos."
                      } else {
                        message = "Você perdeu \(card?.losePoints ?? 0) ponto."
                      }
                      nextPlayer = true
                      title = "Que pena"
                    }
                    .padding(.bottom, -15)
                  
                  Text("Recusar")
                    .font(.custom("macrofont", size: 14))
                    .minimumScaleFactor(0.01)
                    .foregroundColor(.white)
                }
                
                VStack {
                  ButtonCardView(iconName: "ButtonAccept", text: "Aceitar", backgroundImage: "acceptButton")
                    .onTapGesture {
                      gameCore.addPlayerPoints(player: gameCore.playerPlaying!, points: card?.winPoints ?? 0)
                      if (card?.winPoints ?? 0 > 1) {
                        message = "Você ganhou \(card?.winPoints ?? 0) pontos."
                      } else {
                        message = "Você ganhou \(card?.winPoints ?? 0) ponto."
                      }
                      nextPlayer = true
                      title = "Parabéns"
                    }
                    .padding(.bottom, -15)
                  
                  Text("Aceitar")
                    .font(.custom("macrofont", size: 14))
                    .minimumScaleFactor(0.01)
                    .foregroundColor(.white)
                }
              }//: HSTACK
              .opacity(isButtonHiden ? 0 : 1)
              .padding(.bottom, 30)
            } //: VSTACK
            .navigationDestination(isPresented: $backToHome) {
              HomeView()
            }
            .navigationDestination(isPresented: $nextPlayer) {
              AcceptRefuseView(avatar: gameCore.playerPlaying?.wrappedAvatar ?? "", title: $title, text: $message)
                .environmentObject(gameCore)
            }
          } //: ZSTACK
          .navigationBarBackButtonHidden(true)
          .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
              PlayerView(name: gameCore.playerPlaying?.wrappedName ?? "",
                         avatar: gameCore.playerPlaying?.wrappedAvatar ?? "",
                         points: gameCore.playerPlaying?.wrappedPoints)
            }
            ToolbarItem(placement: .navigationBarLeading) {
              Button {
                HapticManager.send(style: .heavy)
                gameCore.resetMatch()
                backToHome = true
              } label: {
                GenericFunctions.checkIfImageExist(name: "pauseButton")
              }
            }
          }
        } else {
          ShuffleAnimation(card: $card).environmentObject(gameCore)
            .onAppear {
              changeShuffle()
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
  
  private func changeShuffle() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      self.animationPresented.toggle()
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
