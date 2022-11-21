//
//  ShuffleAnimation.swift
//  Dizcarta
//
//  Created by Victor Brito on 17/10/22.
//

import SwiftUI
import Lottie

struct ShuffleAnimation: View {
    @EnvironmentObject var router: Router
    @State private var card: CardCodable?
    var body: some View {
        GeometryReader { _ in
            ZStack {
                Color(.backgroundAppColor)
                    .ignoresSafeArea()
                VStack(alignment: .center) {
                    
                    switch card?.type {
                    case .challenge:
                        LottieView(animationName: "NewCardsYellowAnimation.json", loopMode: .repeat(1)) {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                router.pushView(screen: .inGame)
                            }
                        }
                    case .surprise:
                        LottieView(animationName: "NewCardsGreenAnimation.json", loopMode: .repeat(1)) {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                router.pushView(screen: .inGame)
                            }
                        }
                    case .loss:
                        LottieView(animationName: "NewCardsRedAnimation.json", loopMode: .repeat(1)) {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                router.pushView(screen: .inGame)
                            }
                        }
                    case .none:
                        EmptyView()
                    }
                }
                .onAppear {
                   router.gameCore.getRandomCard()
                   self.card = router.gameCore.selectedCard
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
