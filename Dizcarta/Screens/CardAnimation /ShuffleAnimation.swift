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
        GeometryReader { geometry in
            ZStack {
                HStack {
                    Color(.backgroundAppColor)
                        .ignoresSafeArea()
                }
                VStack {
                    LottieView(animationName: "ShuffleAnimation.json", loopMode: .repeat(1))
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .overlay(alignment: .bottom) {
                            NavigationLink(destination: InGameView()) {
                                NeonButton(text: "Virar", image: .neonButtonYellow)
                                    .frame(width: geometry.size.width/1.2, height: geometry.size.height/7)
                            }
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
