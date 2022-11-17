//
//  GamePausedView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 10/11/22.
//

import SwiftUI

struct GamePausedView: View {
  // MARK: - VARIABLES
  @State var isHomePressed: Bool = false
  @State var isBackToGamePressed: Bool = false
  @State var isSettingsPressed: Bool = false
  
  // MARK: - BODY
  var body: some View {
    NavigationStack {
      ZStack {
        Color(.backgroundAppColor)
          .ignoresSafeArea(.all)
        
        VStack {
          Text("O que você deseja fazer?")
            .foregroundColor(.white)
            .font(Font.custom("DINCondensed-Bold", size: 30, relativeTo: .title2))

          Image("gamePausedImage")
            .colorMultiply(Color.white)
          
          Button {
            self.isHomePressed = true
          } label: {
            ZStack {
              Image("leaveGameButton")
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 1.4, height: UIScreen.main.bounds.height / 6.5)
                .colorMultiply(.white)
              
              Text("Sair do Jogo")
                .foregroundColor(.white)
                .font(Font.custom("DINCondensed-Bold", size: 30, relativeTo: .title2))
                .padding(.top, 7)
            }
          }
          .padding(.top, 15)
          .padding(.bottom, -15)
          
          HStack(spacing: 35) {
            Button {
              // TODO: - ADD THE LEAVE GAME ACTION HERE
            } label: {
              VStack {
                ZStack {
                  Image("secondaryButton")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 3.4, height: UIScreen.main.bounds.height / 7)
                    .colorMultiply(.white)
                  
                  Image("trophyButton")
                    .foregroundColor(.white)
                  
                }
                
                Text("Ranking")
                  .foregroundColor(.white)
                  .font(.system(size: 15, weight: .medium))
                  .padding(.top, -15)
              }
            }
            
            Button {
              self.isSettingsPressed = true
            } label: {
              VStack {
                ZStack {
                  Image("secondaryButton")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 3.4, height: UIScreen.main.bounds.height / 7)
                    .colorMultiply(.white)
                  
                  Image("cogsButton")
                    .foregroundColor(.white)
                  
                }
                
                Text("Ajustes")
                  .foregroundColor(.white)
                  .font(.system(size: 15, weight: .medium))
                  .padding(.top, -15)
              }
            }
          } //: HSTACK
        } //: VSTACK
      } //: ZSTACK
      .navigationBarBackButtonHidden(true)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            HapticManager.send(style: .heavy)
          } label: {
            GenericFunctions.checkIfImageExist(name: "exitButton")
              .colorMultiply(.white)
          }
          .padding()
          .navigationDestination(isPresented: $isHomePressed) {
            HomeView()
          }
          .navigationDestination(isPresented: $isSettingsPressed) {
            ConfigurationsView()
          }
        }
      }
    }
  }
}

struct GamePausedView_Previews: PreviewProvider {
  static var previews: some View {
    let devices = ["iPhone SE (3rd generation)","iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
    
    ForEach(devices, id: \.self) { device in
      GamePausedView()
        .previewDevice(PreviewDevice(rawValue: device))
        .previewDisplayName(device)
    }
  }
}
