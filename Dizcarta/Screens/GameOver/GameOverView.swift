//
//  GameOverView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 29/09/22.
//

import SwiftUI

struct GameOverView: View {
  // MARK: - VARIABLES
  
  // MARK: - BODY
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        Color(.backgroundAppColor)
          .ignoresSafeArea(.all)
        
        VStack {
          
          Text("Fim de Jogo!")
            .font(.system(size: 34))
            .foregroundColor(.white)
            .fontWeight(.heavy)
            .padding(.vertical, 30)
          
          VStack {
            PlayerGameOver(name: "Alice", avatarAsset: "avatarRed", podiumPosition: 1, points: 20)
              .padding(.bottom, 20)
            
            HStack(spacing: 60) {
              PlayerGameOver(name: "João", avatarAsset: "avatarYellow", podiumPosition: 2, points: 16)
              PlayerGameOver(name: "Zion", avatarAsset: "avatarTurquoise", podiumPosition: 3, points: 15)
            }
            
          }
          
          Spacer()
          
          NeonButton(text: "Novo Jogo", image: .neonButtonYellow)
            .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 7)
            .shadow(radius: 5)
            .padding(20)
        }
      }
    } //: VSTACK
  }
}

// MARK: - PREVIEW
struct GameOverView_Previews: PreviewProvider {
  static var previews: some View {
    let devices = ["iPhone SE (3rd generation)","iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
    
    ForEach(devices, id: \.self) { device in
      GameOverView()
        .previewDevice(PreviewDevice(rawValue: device))
        .previewDisplayName(device)
    }
  }
}
