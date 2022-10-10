//
//  GameCore+players.swift
//  Dizcarta
//
//  Created by Igor Samoel da Silva on 10/10/22.
//

import Foundation

extension GameCore {
    
    internal func getPlayers(match: MatchInProgress) -> [Player] {
        repository.getPlayers(match: match)
    }
    
    func fetchPlayers() {
        self.players = getPlayers(match: matchInProgress)
    }
    
    func createPlayer(name: String, avatar: String, match: MatchInProgress) {
        repository.createPlayer(name: name, avatar: avatar, match: match)
    }
    
    internal func createMatch() -> MatchInProgress {
        self.repository.createMatch()
    }
    
    func resetMatch() {
        let players = matchInProgress.players?.allObjects as? [Player]
        guard let players else { return }
        players.forEach { player in
            repository.delete(object: player)
        }
        repository.delete(object: matchInProgress)
    }
    
    func getRandomCard() -> CardCodable? {
        guard var cards = self.cardList else { return nil}
        let card = cards.cards.remove(at: Int.random(in: 0...cards.cards.count - 1))
        self.cardList?.cards = cards.cards
        print("Quantidade cartas \(cards.cards.count)")
        return card
    }
}
