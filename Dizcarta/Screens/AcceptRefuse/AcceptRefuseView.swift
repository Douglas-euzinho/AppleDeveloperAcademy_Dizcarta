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
    @Binding var title: String
    @Binding var text: String
    @State var showShiftPlayer = false
    @State var backToHome = false
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
                        
                        Button {
                            showShiftPlayer = true
                            HapticManager.send(style: .heavy)
                        } label: {
                            NeonButton(text: "Continuar", image: .neonButtonYellow)
                                .frame(width: geometry.size.width / 1.7, height: geometry.size.height / 15)
                                .padding(.bottom)
                        }
                    }
                }
                .navigationDestination(isPresented: $showShiftPlayer) {
                    ShiftPlayerView()
                        .environmentObject(gameCore)
                }
                .navigationDestination(isPresented: $backToHome) {
                    HomeView()
                }
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            gameCore.resetMatch()
                            backToHome = true
                        } label: {
                            GenericFunctions.checkIfImageExist(name: "exitButton")
                        }
                    }
                }
            }
        }
    }
}

// struct AcceptRefuseView_Previews: PreviewProvider {
//    static var previews: some View {
//        AcceptRefuseView(avatar: "avatarRed", title: "Parabéns", text: "Você ganhou 4 pontos")
//    }
// }
