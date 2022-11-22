//
//  GamePausedView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 10/11/22.
//

import SwiftUI

struct GamePausedView: View {
    @EnvironmentObject var router: Router
  // MARK: - BODY
  var body: some View {
      ZStack {
        Color(.backgroundAppColor)
          .ignoresSafeArea(.all)
        
        VStack {
          Text("O que você deseja fazer?")
            .foregroundColor(.white)
            .font(Font.custom("DINCondensed-Bold", size: 30, relativeTo: .title2))

          Image("gamePausedImage_2")
            .colorMultiply(Color.white)
          
          Button {
              router.goToRoot()
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
          
          HStack {
            Button {
                router.pushView(screen: .ranking)
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
                  router.pushView(screen: .rules)
              } label: {
                  VStack {
                    ZStack {
                      Image("secondaryButton")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width / 3.4, height: UIScreen.main.bounds.height / 7)
                        .colorMultiply(.white)
                      
                        Image("rulesImage")
                          .foregroundColor(.white)
                    }
                    
                    Text("Regras")
                      .foregroundColor(.white)
                      .font(.system(size: 15, weight: .medium))
                      .padding(.top, -15)
                  }
              }
            
            Button {
                router.pushView(screen: .configuration)
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
          } //: HSTACK
        } //: VSTACK
      } //: ZSTACK
      .navigationBarBackButtonHidden(true)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            HapticManager.send(style: .heavy)
              router.popView()
          } label: {
            GenericFunctions.checkIfImageExist(name: "exitButton")
              .colorMultiply(.white)
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
