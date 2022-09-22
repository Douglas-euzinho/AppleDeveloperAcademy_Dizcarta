//
//  FrontCard.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 22/09/22.
//

import SwiftUI

struct FrontCard: View {
  // MARK: - VARIABLES
  @Binding var image: String
  @Binding var title: String
  @Binding var description: String
  @Binding var acceptPoints: Int
  @Binding var declinePoints: Int
  @Binding var degree: Double
  
  // MARK: - BODY
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(.gray)
        .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 1.9)
        .cornerRadius(15)
        
      VStack {
        Image(systemName: image)
          .resizable()
          .frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.height / 10)
        
        Text(title)
          .font(.title)
          .fontWeight(.medium)
          .padding(.bottom, 15)
        
        Text(description)
          .multilineTextAlignment(.leading)
          .lineLimit(4)
          .padding(.horizontal, 20)
          .padding(.bottom, 20)
        
        VStack(alignment: .leading) {
          Text("Pontos ao aceitar:")
            .fontWeight(.bold)
          
          Text("\(acceptPoints) pontos")
            .padding(.bottom, 10)
          
          Text("Pontos ao recusar:")
            .fontWeight(.bold)
          
          Text("\(declinePoints) pontos")
        }
      }
    } //: ZSTACK
    .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    .frame(width: UIScreen.main.bounds.width / 4.0, height: UIScreen.main.bounds.height / 10)
  } //: BODY
}

struct FrontCard_Previews: PreviewProvider {
  static var previews: some View {
    FrontCard(image: .constant("house.fill"), title: .constant("Doente de Amor"), description: .constant("Você deve ficar de mãos dadas com a pessoa a sua esquerda enquanto joga."), acceptPoints: .constant(4), declinePoints: .constant(4), degree: .constant(0.0))
  }
}
