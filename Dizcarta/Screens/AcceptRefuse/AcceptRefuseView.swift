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
  
  // MARK: - BODY
    var body: some View {
      ZStack {
        Color(.backgroundAppColor)
          .ignoresSafeArea(.all)
        
        VStack {
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
        }
      }
    }
}

struct AcceptRefuseView_Previews: PreviewProvider {
    static var previews: some View {
      AcceptRefuseView(avatar: "avatarRed", title: "Parabéns", text: "Você ganhou 4 pontos")
    }
}
