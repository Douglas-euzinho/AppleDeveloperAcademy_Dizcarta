//
//  SplashScreen.swift
//  Dizcarta
//
//  Created by Victor Brito on 26/09/22.
//

import SwiftUI
import Lottie

struct SplashScreen: View {
    @State private var isRotated = false
    @Binding var isShowingSplash: Bool
    let shared = GenericFunctions()
    
    var body: some View {
        LottieView(animationName: "Splash.json", loopMode: .playOnce) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                isShowingSplash = false
            }
        }
        .frame(width: 400, height: 400)
    }
}

struct ContentView : View {
    @State var splashScreen  = true
    
    var body: some View {
        ZStack {
            Color(.backgroundAppColor)
                .ignoresSafeArea()
            Group {
                if splashScreen {
                    SplashScreen(isShowingSplash: $splashScreen)
                } else {
                    HomeView()
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen(isShowingSplash: .constant(true))
    }
}
