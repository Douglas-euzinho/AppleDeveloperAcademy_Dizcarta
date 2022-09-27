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
    var foregroundColor: Color?
    var actionChoosed: Int?
    var cardType: CardType
    var points: Int?
    
    let shared = GenericFunctions()
    
    init(foregroundColor: Color? = nil, actionChoosed: Int? = nil, cardType: CardType, points: Int? = nil) {
        self.foregroundColor = foregroundColor
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
    }
    
    func checkAction(cardType: CardType) -> Image? {
        if cardType == .conventional {
            switch actionChoosed {
            case 0:
                return shared.checkIfImageExist(name: "FaceSad")
            case 1:
                return shared.checkIfImageExist(name: "FaceHappy")
            default:
                return shared.checkIfImageExist(name: "FaceHappy")
            }
        } else if cardType == .loss {
            return shared.checkIfImageExist(name: "FaceSad")
        }
        return shared.checkIfImageExist(name: "FaceHappy")
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
        ActionChoise(actionChoosed: 1, cardType: .surprise, points: 2)
    }
}
