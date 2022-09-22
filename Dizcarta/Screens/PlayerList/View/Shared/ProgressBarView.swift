//
//  ProgressBar.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 21/09/22.
//

import SwiftUI

struct ProgressBarView: View {
  // MARK: - VARIABLES
  @State var minPlayers: Int
  @State var maxPlayers: Int
  @State var currentProgress: CGFloat
  
  // MARK: - BODY
  var body: some View {
    // MARK: - VSTACK
    VStack {
      // MARK: - ZSTACK
      ZStack(alignment: .leading) {
        // MARK: - PROGRESS BAR
        Group {
          Rectangle()
            .foregroundColor(.gray)
            .frame(width: UIScreen.main.bounds.width - 30, height: 8)
          
          Rectangle()
            .foregroundColor(.black)
            .frame(width: (UIScreen.main.bounds.width - 30) * currentProgress, height: 8)
        } //: PROGRESS BAR
      } //: ZSTACK
      
      // MARK: - PLAYERS
      Text(" \(minPlayers)/\(maxPlayers) Jogadores")
    } //: VSTACK
  } //: VIEW
}

struct ProgressBar_Previews: PreviewProvider {
  static var previews: some View {
    ProgressBarView(minPlayers: 0, maxPlayers: 6, currentProgress: 0.5)
  }
}
