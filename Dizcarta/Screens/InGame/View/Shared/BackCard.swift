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
  
  // MARK: - BODY
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(.gray)
        .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 1.6)
        .cornerRadius(15)
      Image("CardLogo")
        .resizable()
        .frame(width: UIScreen.main.bounds.width / 1.65, height: UIScreen.main.bounds.height / 5, alignment: .center)
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
