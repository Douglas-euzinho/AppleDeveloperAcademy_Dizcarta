//
//  FrontCard.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 22/09/22.
//

import SwiftUI

struct FrontCard: View {
    // MARK: - VARIABLES
    @Binding var title: String
    @Binding var description: String
    @Binding var acceptPoints: Int
    @Binding var declinePoints: Int
    @Binding var degree: Double
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(.cardColor))
                .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 1.6)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(Font.custom("DINCondensed-Bold", size: 34))
                    .foregroundColor(.white)
                    .padding(.bottom, 15)
                
                Text(description)
                    .font(Font.custom("DINAlternate-Bold", size: 22))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(6)
                    .padding(.bottom, 20)
                
                Text("Pontos ao aceitar: +\(acceptPoints) pontos")
                    .font(Font.custom("DINAlternate-Bold", size: 15))
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                
                Text("Pontos ao recusar: -\(declinePoints) pontos")
                    .font(Font.custom("DINAlternate-Bold", size: 15))
                    .foregroundColor(.white)
            }
            .padding(.horizontal)

        } //: ZSTACK
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
        .frame(width: UIScreen.main.bounds.width / 4.0, height: UIScreen.main.bounds.height / 10)
    } //: BODY
}

struct FrontCard_Previews: PreviewProvider {
    static var previews: some View {
        FrontCard(title: .constant("Doente de Amor"),
                  description: .constant("Você deve ficar de mãos dadas com a pessoa a sua esquerda enquanto joga"),
                  acceptPoints: .constant(4),
                  declinePoints: .constant(4),
                  degree: .constant(0)
        )
    }
}
