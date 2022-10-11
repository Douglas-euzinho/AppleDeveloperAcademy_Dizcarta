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
        NavigationView {
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
                    
                    NeonButton(text: "Embaralhar", image: .homeButton)
                        .frame(width: 287, height: 65)
                        .shadow(radius: 10)
                        .padding(.bottom, 60)
                } //: VSTACK
            } //: ZSTACK
        } //: NAVIGATION VIEW
        .tint(.white)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                HStack {
            Image(systemName: "chevron.left")
            Text("Sair")
                .fontWeight(.medium)
        }
            .foregroundColor(.white)
            .onTapGesture {
                self.presentation.wrappedValue.dismiss()
            }
        )
    }
}

// MARK: - PREVIEW
struct ShiftPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftPlayerView()
    }
}
