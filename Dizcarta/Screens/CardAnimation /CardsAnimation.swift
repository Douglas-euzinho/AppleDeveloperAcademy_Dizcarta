//
//  CardsAnimation.swift
//  Dizcarta
//
//  Created by Victor Brito on 10/10/22.
//

import SwiftUI
import Lottie

struct CardsAnimation: View {
    var body: some View {
        LottieView(animationName: "Splash.json", loopMode: .loop)
            .frame(width: 200, height: 200)
    }
}

struct CardsAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CardsAnimation()
    }
}
