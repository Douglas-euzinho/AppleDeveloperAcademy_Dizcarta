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
                GenericFunctions.checkIfImageEnumExist(name: .redPrimaryButton)
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 6.5)
                .colorMultiply(.white)
              
              Text("Sair do Jogo")
                .foregroundColor(.white)
                .font(Font.custom("DINCondensed-Bold", size: 30, relativeTo: .title2))
                .padding(.top, 7)
                
            } //: ZSTACK
          }
          .padding(.top, 15)
          .padding(.bottom, -15)

            HStack(spacing: -5) {
            Button {
                router.pushView(screen: .ranking)
            } label: {
              VStack {
                ZStack {
                  Image("secondaryButton2")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.height / 8.6)
                    .colorMultiply(.white)
                  
                    Image("trophyButton")
                        .resizable()
                        .frame(width: 35, height: 35)
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
                      Image("secondaryButton2")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.height / 8.6)
                        .colorMultiply(.white)
                      
                        Image("rulesImage")
                            .resizable()
                            .frame(width: 30, height: 30)
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
                  Image("secondaryButton2")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.height / 8.6)
                    .colorMultiply(.white)
                  
                  Image("cogsButton")
                        .resizable()
                        .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                  
                }
                
                Text("Ajustes")
                  .foregroundColor(.white)
                  .font(.system(size: 15, weight: .medium))
                  .padding(.top, -15)
            } //: VSTACK
          }
        } //: HSTACK
      } //: VSTACK
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
