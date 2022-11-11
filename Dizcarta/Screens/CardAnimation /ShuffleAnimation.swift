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
  @Binding var card: CardCodable?
  var body: some View {
    GeometryReader { _ in
      NavigationStack {
        ZStack {
          Color(.backgroundAppColor)
            .ignoresSafeArea()
          VStack(alignment: .center) {
            
            switch card?.type {
            case .challenge:
              LottieView(animationName: "NewCardsYellowAnimation.json", loopMode: .repeat(1)) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                  showInGame = true
                }
              }
            case .surprise:
              LottieView(animationName: "NewCardsGreenAnimation.json", loopMode: .repeat(1)) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                  showInGame = true
                }
              }
            case .loss:
              LottieView(animationName: "NewCardsRedAnimation.json", loopMode: .repeat(1)) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                  showInGame = true
                }
              }
            case .none:
              EmptyView()
            }
          }
        }
        .onAppear {
          self.card = gameCore.getRandomCard()
        }
      }
      .navigationBarBackButtonHidden(true)
    }
  }
}

// struct ShuffleAnimation_Previews: PreviewProvider {
//    static var previews: some View {
//        let devices = [ "iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
//
//        ForEach(devices, id: \.self) { device in
//            ShuffleAnimation()
//                .previewDevice(PreviewDevice(rawValue: device))
//                .previewDisplayName(device)
//        }
//    }
// }
