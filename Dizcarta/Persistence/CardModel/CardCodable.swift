//
//  CardCodable.swift
//  Dizcarta
//
//  Created by Igor Samoel da Silva on 06/10/22.
//

import Foundation
import CoreData
import UIKit

struct CardCodable: Codable {
    let id: Int
    let title: String
    let image: String
    let winPoints: Int
    let losePoints: Int
    let dizDescription: String
    
    func createEntity(context: NSManagedObjectContext) -> Card {
        let card = Card(context: context)
        card.cardId = Int16(id)
        card.title = title
        card.image = UIImage(named: image)?.pngData()
        card.winPoints = Int16(winPoints)
        card.losePoints = Int16(losePoints)
        card.dizDescription = dizDescription
        return card
    }
}

struct CardList: Codable {
    var cards: [CardCodable]
}
