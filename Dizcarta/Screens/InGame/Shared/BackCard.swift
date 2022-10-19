//
//  BackCard.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 22/09/22.
//

import SwiftUI

struct BackCard: View {
  // MARK: - VARIABLES
  @Binding var degree: Double
  let screen = UIScreen.main.bounds
    
  // MARK: - BODY
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(Color(.cardColor))
        .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 1.6)
        .cornerRadius(15)
        
      Image("backgroundCardLogo")
        .resizable()
        .frame(width: screen.width / 1.2, height: screen.height / 1.6, alignment: .center)
        .padding(.bottom, 40)
    } //: ZSTACK
    .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
  } //: BODY
}

// MARK: - PREVIEW
struct BackCard_Previews: PreviewProvider {
  static var previews: some View {
    BackCard(degree: .constant(0.0))
  }
}
