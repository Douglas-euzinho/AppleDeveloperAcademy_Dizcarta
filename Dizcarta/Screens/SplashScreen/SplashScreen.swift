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
        LottieView(animationName: "SplashScreenApp.json", loopMode: .playOnce) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                isShowingSplash = false
            }
        }
        .frame(width: 400, height: 400)
    }
}

struct CoordinatorView : View {
    @State var splashScreen  = true
    @StateObject var router = Router()
    var body: some View {
        NavigationStack(path: $router.path) {
            ZStack {
                Color(.backgroundAppColor)
                    .ignoresSafeArea()
                Group {
                    if splashScreen {
                        SplashScreen(isShowingSplash: $splashScreen)
                    } else {
                        HomeView()
                            .environmentObject(router)
                    }
                }
            }
            .navigationDestination(for: Screen.self) { screen in
                switch screen {
                case .configuration:
                    ConfigurationsView()
                        .environmentObject(router)
                case .setupMatch:
                    SetupMatchView()
                        .environmentObject(router)
                case .shiftPlayer:
                    ShiftPlayerView()
                        .environmentObject(router)
                case .inGame:
                    InGameView()
                        .environmentObject(router)
                case .gamePaused:
                    GamePausedView()
                        .environmentObject(router)
                case .gameOver:
                    GameOverView()
                        .environmentObject(router)
                case .acceptRefuse:
                    AcceptRefuseView()
                        .environmentObject(router)
                case .shuffleAnimation:
                    ShuffleAnimation()
                        .environmentObject(router)
                case .rules:
                    RulesView()
                        .environmentObject(router)
                case .ranking:
                    RankingView()
                        .environmentObject(router)
                case .feedbackBack:
                    FeedbackBackView()
                        .environmentObject(router)
                default:
                    HomeView()
                        .environmentObject(router)
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
