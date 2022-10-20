//
//  ShiftPlayerView.swift
//  Dizcarta
//
//  Created by Victor Brito on 28/09/22.
//

import SwiftUI

struct ShiftPlayerView: View {
    // MARK: - PROPERTIES
    @State private var player: Player?
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var gameCore: GameCore
    @State var backToHome = false
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    Color(.backgroundAppColor)
                        .ignoresSafeArea(.all)
                    
                    VStack {
                        Spacer()
                        
                        Text("Agora é a vez de:")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .regular))
                            .padding(5)
                        
                        Text(player?.wrappedName ?? "")
                            .font(Font.custom("DINCondensed-Bold", size: 34))
                            .foregroundColor(.white)
                        
                        Image(player?.wrappedAvatar ?? "")
                            .resizable()
                            .padding(-50)
                            .frame(width: 200, height: 200)
                            .disabled(true)
                        
                        Spacer()
                        
                        NavigationLink(destination: ShuffleAnimation().environmentObject(gameCore)) {
                            NeonButton(text: "Embaralhar", image: .neonButtonYellow)
                                .frame(width: geometry.size.width/1.6, height: geometry.size.height/7)
                                .shadow(radius: 10)
                                .padding(.bottom, 15)
                        }
                    } //: VSTACK
                    .navigationDestination(isPresented: $backToHome) {
                        HomeView()
                    }
                } //: ZSTACK
                .onAppear {
                    player = gameCore.nextPlayer()
            }
            }
        } //: GEOMETRYREADER VIEW
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationLink(destination: HomeView()) {
                    // TODO: Trocar por button
                    GenericFunctions.checkIfImageExist(name: "exitButton")
                        .onTapGesture {
                            gameCore.resetMatch()
                            backToHome = true
                        }
                }
            }
        }
    }
}

//PREVIEW APRESENTANDO CRASH
// MARK: - PREVIEW
//struct ShiftPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        let devices = [ "iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
//
//        ForEach(devices, id: \.self) { device in
//            ShiftPlayerView()
//                .previewDevice(PreviewDevice(rawValue: device))
//                .previewDisplayName(device)
//        }
//    }
//}
