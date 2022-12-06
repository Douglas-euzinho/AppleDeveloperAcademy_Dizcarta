//
//  GameCore+Utils.swift
//  Dizcarta
//
//  Created by Igor Samoel da Silva on 01/12/22.
//

import Foundation

extension GameCore {
    
    func loadCards() {
        Task(priority: .high) {
            if AppConfig.useRemoteCards {
                if let allCards = try? await CardsManager.requestCards(cardsURL: "https://dizcarta.github.io/cards/cardsV2.json") {
                    self.cardList = allCards
                    Logger(context: .game).log("ONLINE CARDS CREATED \(allCards.cards.count)")
                }
            } else {
                self.cardList = CardsManager.decodeJson(forName: cardFile)
            }
            var cards = self.cardList?.cards ?? []
#if DEBUG
            cards.removeSubrange(0...12)
            cards.removeAll(where: {$0.type == .challenge && AppConfig.onlySpecialCards })
#endif
            self.cardList?.cards = cards.shuffled()
        }
    }
    
    func restartGame() {
        repository.resetPlayersPoints()
        loadCards()
        playersTurn = []
        isGameFinished = false
        playerPlaying = nil
        selectedCard = nil
        acceptOrRefuseMessage = ""
        acceptOrRefuseTitle = ""
    }
}
