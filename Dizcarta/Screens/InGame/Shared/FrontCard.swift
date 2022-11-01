//
//  FrontCard.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 22/09/22.
//

import SwiftUI

struct FrontCard: View {
    // MARK: - VARIABLES
    var title: String
    var description: String
    var acceptPoints: Int
    var declinePoints: Int
    var cardColor: String
    var textCardColor: String
    var backgroundTextCardColor: String
    @Binding var degree: Double
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(Color(cardColor))
                    .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 1.6)
                    .cornerRadius(10)
                    .overlay {
                        GeometryReader { geometry2 in
                            VStack {
                                Rectangle()
                                    .foregroundColor(Color(backgroundTextCardColor))
                                    .frame(width: geometry2.size.width/1.1, height: geometry2.size.height/10)
                                    .cornerRadius(10)
                                    .overlay {
                                        Text(title)
                                            .font(Font.custom("DINCondensed-Bold", size: 34))
                                            .foregroundColor(.black)
                                            .padding(.trailing, 50)
                                            
                                    }
                                    .padding()
                                
                                Rectangle()
                                    .foregroundColor(Color(backgroundTextCardColor))
                                    .frame(width: geometry2.size.width/1.1, height: geometry2.size.height/1.9)
                                    .cornerRadius(10)
                                    .overlay {
                                        VStack(alignment: .leading) {
                                            Spacer()
                                            Text("Descrição:")
                                                .font(Font.custom("DINCondensed-Bold", size: 30))
                                                .foregroundColor(Color(textCardColor))
                                            Spacer()
                                            Text(description)
                                                .font(Font.custom("DINAlternate-Bold", size: 24))
                                                .foregroundColor(.black)
                                                .lineLimit(6)
                                            Spacer()
                                        }
                                    }
                                
                                Rectangle()
                                    .foregroundColor(Color(backgroundTextCardColor))
                                    .frame(width: geometry2.size.width/1.1, height: geometry2.size.height/5)
                                    .cornerRadius(10)
                                    .overlay {
                                        VStack(alignment: .leading) {
                                            Text("Pontuação:")
                                                .font(Font.custom("DINCondensed-Bold", size: 30))
                                                .foregroundColor(Color(textCardColor))
                                            HStack {
                                                Text("Aceitação:")
                                                    .font(Font.custom("DINAlternate-Bold", size: 17))
                                                    .foregroundColor(Color(textCardColor))
                                                Spacer()
                                                Text("+\(acceptPoints)")
                                                    .foregroundColor(.black)
                                            }
                                            HStack {
                                                Text("Recusa:")
                                                    .font(Font.custom("DINAlternate-Bold", size: 17))
                                                    .foregroundColor(Color(textCardColor))
                                                Spacer()
                                                Text("+\(declinePoints)")
                                                    .foregroundColor(.black)
                                            }
                                        }
                                        .padding()
                                    }
                            }
                        }
                    }
            } //: ZSTACK
            .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    } //: BODY
}

struct FrontCard_Previews: PreviewProvider {
    static var previews: some View {
        FrontCard(title: "Doente de Amor",
                  description: "Você deverá ficar de mãos dadas com a pessoa a sua esquerda, enquanto joga.",
                  acceptPoints: 4,
                  declinePoints: 4,
                  cardColor: "yellow_card",
                  textCardColor: "yellow_text_card",
                  backgroundTextCardColor: "yellow_background_text_card",
                  degree: .constant(0))
    }
}
