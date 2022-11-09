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
  var cardImage: String
  let screen = UIScreen.main.bounds
    
  // MARK: - BODY
  var body: some View {
    ZStack {
      Image(cardImage)
        .resizable()
        .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 1.6)
    } //: ZSTACK
    .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
  } //: BODY
}

// MARK: - PREVIEW
struct BackCard_Previews: PreviewProvider {
  static var previews: some View {
    let devices = ["iPhone SE (3rd generation)","iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
    
    ForEach(devices, id: \.self) { device in
      BackCard(degree: .constant(0.0), cardImage: "challengeCard")
        .previewDevice(PreviewDevice(rawValue: device))
        .previewDisplayName(device)
    }
  }
}
