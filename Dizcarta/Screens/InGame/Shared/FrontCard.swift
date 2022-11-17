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
  @State var cardType: CardType
  @Binding var degree: Double
  var isChallenge: Bool {
    cardType == .challenge
  }
  // MARK: - BODY
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        Rectangle()
          .foregroundColor(Color(AppColor.getCardColor(type: cardType)))
          .frame(
            width: UIScreen.main.bounds.width / 1.1,
            height: UIScreen.main.bounds.height / 1.6
          )
          .cornerRadius(10)
          .overlay {
            GeometryReader { geometry2 in
              VStack {
                Rectangle()
                  .foregroundColor(Color(AppColor.getBackgroundTextColor(type: cardType)))
                  .frame(width: geometry2.size.width / 1.1, height: geometry2.size.height / 10)
                  .cornerRadius(10)
                  .overlay {
                    Text(title)
                      .font(.system(size: 30, weight: .bold))
                      .frame(width: (geometry2.size.width / 1.1) - 30, height: geometry2.size.height / 10)
                      .foregroundColor(.black)
                      .minimumScaleFactor(0.4)
                    
                  }
                  .padding()
                
                Rectangle()
                  .foregroundColor(Color(AppColor.getBackgroundTextColor(type: cardType)))
                  .frame(width: geometry2.size.width / 1.1, height: geometry2.size.height / (isChallenge ? 1.9 : 1.3))
                  .cornerRadius(10)
                  .overlay {
                    VStack(alignment: .leading) {
                      Text("Descrição:")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color(AppColor.getCardTextColor(type: cardType)))
                        .padding(.bottom, -5)
                        .minimumScaleFactor(0.2)
                      
                      Text(description)
                        .font(.system(size: 28, weight: .regular))
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.2)
                        .lineLimit(6)
                      
                      Spacer()
                    }
                    .padding()
                  }
                
                if cardType == .challenge {
                  Rectangle()
                    .foregroundColor(Color(AppColor.getBackgroundTextColor(type: cardType)))
                    .frame(width: geometry2.size.width / 1.1, height: geometry2.size.height / 4.6)
                    .cornerRadius(10)
                    .overlay {
                      VStack(alignment: .leading) {
                        Text("Pontuação:")
                          .font(.system(size: 30, weight: .bold))
                          .foregroundColor(Color(AppColor.getCardTextColor(type: cardType)))
                          .padding(.bottom, -5)
                        
                        HStack {
                          Text("Aceitação:")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(Color(AppColor.getCardTextColor(type: cardType)))
                          
                          Spacer()
                          
                          Text("+\(acceptPoints)")
                            .foregroundColor(.black)
                        }
                        
                        HStack {
                          Text("Recusa:")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(Color(AppColor.getCardTextColor(type: cardType)))
                          
                          Spacer()
                          
                          Text("-\(declinePoints)")
                            .foregroundColor(.black)
                        }
                      }
                      .padding()
                    }
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
    let devices = ["iPhone SE (3rd generation)","iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
    
    ForEach(devices, id: \.self) { device in
      FrontCard(title: "Ninguém solta a mão de ninguém",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                acceptPoints: 4,
                declinePoints: 4, cardType: .challenge,
                degree: .constant(0))
      .previewDevice(PreviewDevice(rawValue: device))
      .previewDisplayName(device)
    }
  }
}
