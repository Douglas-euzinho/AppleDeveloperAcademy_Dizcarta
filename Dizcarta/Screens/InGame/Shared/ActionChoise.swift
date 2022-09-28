//
//  ActionChoise.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 27/09/22.
//

import SwiftUI

enum CardType {
    case conventional, surprise, loss
}

struct ActionChoise: View {
    var backgroundColor: Color
    var actionChoosed: Int?
    var cardType: CardType
    var points: Int?
        
    init(backgroundColor: Color, actionChoosed: Int? = nil, cardType: CardType, points: Int? = nil) {
        self.backgroundColor = backgroundColor
        self.actionChoosed = actionChoosed
        self.cardType = cardType
        self.points = points
    }
    
    var body: some View {
        VStack {
            checkAction(cardType: self.cardType)
                .padding(15)
            checkCardType(actionChoosed: self.actionChoosed ?? 0)
                .padding(10)
                checkText(points: self.points ?? 0, cardType: self.cardType)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
        .ignoresSafeArea(.all)
    }
    
    func checkAction(cardType: CardType) -> Image? {
        if cardType == .conventional {
            switch actionChoosed {
            case 0:
                return GenericFunctions.checkIfImageExist(name: "FaceSad")
            case 1:
                return GenericFunctions.checkIfImageExist(name: "FaceHappy")
            default:
                return GenericFunctions.checkIfImageExist(name: "FaceHappy")
            }
        } else if cardType == .loss {
            return GenericFunctions.checkIfImageExist(name: "FaceSad")
        }
        return GenericFunctions.checkIfImageExist(name: "FaceHappy")
    }
    
    func checkText(points: Int, cardType: CardType) -> Text? {
        if cardType == .conventional {
            switch actionChoosed {
            case 0:
                return Text("Você perdeu \(points) pontos!")
            case 1:
                return Text("Você ganhou \(points) pontos!")
            default:
                return nil
            }
        } else {
            return Text("Sua ação foi concluída com sucesso!")
        }
    }
    
    func checkCardType(actionChoosed: Int) -> Text? {
        switch cardType {
        case .conventional:
            if actionChoosed == 0 {
                return Text("Poxa!")
                    .font(.headline)
            } else {
                return Text("Parabéns!")
                    .font(.headline)
            }
        case .surprise:
            return Text("Muito bem!")
                .font(.headline)
        case .loss:
            return Text("Que pena!")
                .font(.headline)
        }
    }
}

struct ActionChoise_Previews: PreviewProvider {
    static var previews: some View {
        ActionChoise(backgroundColor: Color.blue, actionChoosed: 1, cardType: .surprise, points: 2)
    }
}
