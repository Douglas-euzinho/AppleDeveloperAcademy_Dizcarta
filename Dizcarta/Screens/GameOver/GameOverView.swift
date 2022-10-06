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
    VStack {
      
      Text("Fim de Jogo!")
        .font(.system(size: 34))
        .fontWeight(.heavy)
        .padding(.top, 50)
      
      Spacer(minLength: 30.0)
      } //: HSTACK
      
      Spacer()
      
      GenericButtons(label: "Novo Jogo")
        .frame(width: 233, height: 46)
        .shadow(radius: 5)
        .padding()
        
      GenericButtons(label: "Ranking", color: .gray)
        .frame(width: 233, height: 46)
        .shadow(radius: 5)

    } //: VSTACK
  }

// MARK: - PREVIEW
struct GameOverView_Previews: PreviewProvider {
  static var previews: some View {
    GameOverView()
  }
}
