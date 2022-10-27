//
//  AcceptRefuseView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 20/10/22.
//

import SwiftUI

struct AcceptRefuseView: View {
    // MARK: - VARIABLES
    var avatar: String
    var title: String
    var text: String
    @State var showShuffle = false
    @EnvironmentObject var gameCore: GameCore
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Color(.backgroundAppColor)
                        .ignoresSafeArea(.all)
                    
                    VStack {
                        Spacer()
                        
                        Image(avatar)
                            .resizable()
                            .frame(width: 240, height: 240)
                            .padding(-20)
                        
                        Text(title)
                            .font(Font.custom("DINCondensed-Bold", size: 34))
                            .foregroundColor(.white)
                        
                        Text(text)
                            .font(Font.custom("DINCondensed-Bold", size: 22))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        NeonButton(text: "Continuar", image: .neonButtonYellow)
                            .hapticFeedback(feedbackStyle: .heavy)
                            .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 7)
                            .padding(.bottom)
                            .onTapGesture {
                                showShuffle = true
                            }
                    }
                }
                .navigationDestination(isPresented: $showShuffle) {
                    ShiftPlayerView()
                        .environmentObject(gameCore)
                }
            .navigationBarBackButtonHidden(true)
            }
        }
    }
}

// struct AcceptRefuseView_Previews: PreviewProvider {
//    static var previews: some View {
//        AcceptRefuseView(avatar: "avatarRed", title: "Parabéns", text: "Você ganhou 4 pontos")
//    }
// }
