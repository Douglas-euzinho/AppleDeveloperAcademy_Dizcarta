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

    let shared = GenericFunctions()

    var body: some View {
            LottieView(animationName: "Splash.json", loopMode: .loop)
                .frame(width: 800, height: 800)
        }
    }

struct ContentView : View {
    @State var splashScreen  = true
    
    var body: some View {
        ZStack {
            Group {
                if splashScreen {
                    SplashScreen()
                } else {
                    #warning("Remover")
                    HomeView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                splashScreen = false
                            }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
