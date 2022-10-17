//
//  ShuffleAnimation.swift
//  Dizcarta
//
//  Created by Victor Brito on 17/10/22.
//

import SwiftUI
import Lottie

struct ShuffleAnimation: View {
    var body: some View {
        ZStack {
            Color(.backgroundAppColor)
                .ignoresSafeArea()
            LottieView(animationName: "ShuffleAnimation.json", loopMode: .repeat(1))
                .frame(width: 900, height: 900)
        }
    }
}

struct ShuffleAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ShuffleAnimation()
    }
}
