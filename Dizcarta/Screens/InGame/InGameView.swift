//
//  InGameView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 22/09/22.
//

import SwiftUI

struct InGameView: View {
    @Environment(\.dismiss) var dismiss
    
    // MARK: - VARIABLES
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false
    var btnAction: (() -> Void) = {}
    
    let durationAndDelay : CGFloat = 0.3
    
    var body: some View {
        ZStack {
            GenericFunctions.checkIfImageExist(name: "exitButton")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment.topLeading)
                .padding()
            VStack {
                ZStack {
                    FrontCard(image: .constant("house.fill"),
                              title: .constant("Doente de Amor"),
                              description: .constant("Você deve ficar de mãos dadas com a pessoa a sua esquerda enquanto joga."),
                              acceptPoints: .constant(4), declinePoints: .constant(4), degree: $frontDegree)
                    BackCard(degree: $backDegree)
                }.onTapGesture {
                    flipCard()
                }
                .padding(30)
                HStack {
                    ButtonCardView(iconName: "ButtonAccept", text: "Aceitar")
                        .onTapGesture {
                            btnAction()
                            dismiss.callAsFunction()
                        }
                    ButtonCardView(iconName: "ButtonRefuse", text: "Recusar")
                        .onTapGesture {
                            btnAction()
                            dismiss.callAsFunction()
                        }
                }
            }
        }
    }
    // MARK: Flip Card Function
    func flipCard() {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                backDegree = 0
            }
        }

    }
  }

struct InGameView_Previews: PreviewProvider {
    static var previews: some View {
        InGameView()
    }
}
