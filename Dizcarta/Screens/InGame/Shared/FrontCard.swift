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
          .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 1.6)
          .cornerRadius(10)
          .overlay {
            GeometryReader { geometry2 in
              VStack {
                Rectangle()
                  .foregroundColor(Color(backgroundTextCardColor))
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
                  .foregroundColor(Color(backgroundTextCardColor))
                  .frame(width: geometry2.size.width / 1.1, height: geometry2.size.height / 1.9)
                  .cornerRadius(10)
                  .overlay {
                    VStack(alignment: .leading) {
                      Text("Descrição:")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color(textCardColor))
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
                
                Rectangle()
                  .foregroundColor(Color(backgroundTextCardColor))
                  .frame(width: geometry2.size.width / 1.1, height: geometry2.size.height / 4.6)
                  .cornerRadius(10)
                  .overlay {
                    VStack(alignment: .leading) {
                      Text("Pontuação:")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color(textCardColor))
                        .padding(.bottom, -5)
                      
                      HStack {
                        Text("Aceitação:")
                          .font(.system(size: 14, weight: .regular))
                          .foregroundColor(Color(textCardColor))
                        
                        Spacer()
                        
                        Text("+\(acceptPoints)")
                          .foregroundColor(.black)
                      }
                      
                      HStack {
                        Text("Recusa:")
                          .font(.system(size: 14, weight: .regular))
                          .foregroundColor(Color(textCardColor))
                        
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
                declinePoints: 4,
                cardColor: "yellow_card",
                textCardColor: "yellow_text_card",
                backgroundTextCardColor: "yellow_background_text_card",
                degree: .constant(0))
      .previewDevice(PreviewDevice(rawValue: device))
      .previewDisplayName(device)
    }
  }
}
