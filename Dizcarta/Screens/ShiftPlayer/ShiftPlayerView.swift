//
//  ShiftPlayerView.swift
//  Dizcarta
//
//  Created by Victor Brito on 28/09/22.
//

import SwiftUI

struct ShiftPlayerView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var router: Router
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.backgroundAppColor)
                    .ignoresSafeArea(.all)
                
                VStack {
                    Spacer()
                    Text("Agora é a vez de:")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .regular))
                        .padding(5)
                    
                    Text(router.gameCore.playerPlaying?.wrappedName ?? "")
                        .font(Font.custom("DINCondensed-Bold", size: 34))
                        .foregroundColor(.white)
                    
                    Image(router.gameCore.playerPlaying?.wrappedAvatar ?? "")
                        .resizable()
                        .padding(-50)
                        .frame(width: 200, height: 200)
                        .disabled(true)
                    
                    Spacer()
                    
                    Button {
                        router.pushView(screen: .shuffleAnimation)
                        HapticManager.send(style: .heavy)
                    } label: {
                        NeonButton(text: "Embaralhar", image: .redButton, font: .dinCondensedBold)
                            .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 8)
                            .shadow(radius: 10)
                            .padding(.bottom, 15)
                    }
                    
                } //: VSTACK
            } //: ZSTACK
            .onAppear {
                router.gameCore.verifyMatchIsEnded()
            }
        } //: GEOMETRYREADER VIEW
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                GenericFunctions.checkIfImageExist(name: "pauseButton")
                    .onTapGesture {
                        router.pushView(screen: .gamePaused)
                    }
            }
        }
    }
}

// PREVIEW APRESENTANDO CRASH
// MARK: - PREVIEW
// struct ShiftPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        let devices = [ "iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
//
//        ForEach(devices, id: \.self) { device in
//            ShiftPlayerView()
//                .previewDevice(PreviewDevice(rawValue: device))
//                .previewDisplayName(device)
//        }
//    }
// }
