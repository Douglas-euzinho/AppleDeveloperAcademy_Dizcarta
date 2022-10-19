//
//  ShiftPlayerView.swift
//  Dizcarta
//
//  Created by Victor Brito on 28/09/22.
//

import SwiftUI

struct ShiftPlayerView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentation
    
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
                    
                    Text("Vermelho")
                        .font(Font.custom("DINCondensed-Bold", size: 34))
                        .foregroundColor(.white)
                    
                    Image("avatarRed")
                        .resizable()
                        .padding(-50)
                        .frame(width: 200, height: 200)
                        .disabled(true)
                    
                    Spacer()
                    
                    NavigationLink(destination: ShuffleAnimation()) {
                        NeonButton(text: "Embaralhar", image: .neonButtonYellow)
                            .frame(width: geometry.size.width/1.6, height: geometry.size.height/7)
                            .shadow(radius: 10)
                            .padding(.bottom, 15)
                    }
                } //: VSTACK
            } //: ZSTACK
        } //: GEOMETRYREADER VIEW
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationLink(destination: HomeView()) {
                    GenericFunctions.checkIfImageExist(name: "exitButton")
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct ShiftPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        let devices = [ "iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
        
        ForEach(devices, id: \.self) { device in
            ShiftPlayerView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
