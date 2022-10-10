//
//  GameCore.swift
//  Dizcarta
//
//  Created by Igor Samoel da Silva on 10/10/22.
//

import Foundation
import CoreData

final class GameCore: ObservableObject {

    let cardFile: String
    var cardList: CardList?
    
    @Published var context: NSManagedObjectContext
    @Published var matchInProgress: MatchInProgress
    @Published var players: [Player] = []
    var repository: GameRepositoryProtocol
    
    init(context: NSManagedObjectContext, cardFile: String) {
        self.cardFile = cardFile
        self.context = context
        self.repository = PlayerRepository.get(context: context)
        self.matchInProgress = repository.createMatch()
    }
}
