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
        if !players.contains(where: { $0.avatar == avatar }) {
            repository.createPlayer(name: name, avatar: avatar, match: matchInProgress)
        }
        self.players = repository.getPlayers(match: matchInProgress)
        self.objectWillChange.send()
    }
    
    internal func createMatch() -> MatchInProgress {
        self.repository.createMatch()
    }
    
    func resetMatch() {
        let players = getPlayers(match: matchInProgress)
        players.forEach { player in
            repository.delete(object: player)
        }
        self.players = []
        repository.delete(object: matchInProgress)
        repository.removeAllMatchesInProgress()
    }
    
    func getRandomCard() -> CardCodable? {
        guard var list = self.cardList?.cards, !list.isEmpty else { return nil}
        let card = list.remove(at: Int.random(in: 0...(list.count - 1)))
        self.cardList?.cards = list
        return card
    }
    
    func removePlayerPoints(player: Player, points: Int) {
        repository.removePlayerPoints(player: player, points: points)
        if player.points == 0 {
            playerLost = PlayerLost(player: player, isLost: true)
        }
    }
    
    func addPlayerPoints(player: Player, points: Int) {
        repository.addPlayerPoints(player: player, points: points)
    }
    
    func transferPlayerPoints(from: Player, toPlayer: Player, points: Int) {
        removePlayerPoints(player: from, points: points)
        addPlayerPoints(player: toPlayer, points: points)
    }
    
    func getRanking() -> [Player] {
        repository.getRanking(match: matchInProgress)
    }
    
    func nextPlayer() {
        if turn == 6 {
            turn = 1
        }
       guard let player = players.first(where: { Int($0.turn) == turn && $0.points > 0 })
        else {
           turn += 1
           return nextPlayer()
       }
        turn += 1
        playerPlaying = player
    }
    
    func verifyMatchIsEnded() {
        guard let cardList else { return }
        if cardList.cards.isEmpty {
            self.isGameFinished = true
            return
        }
        
        if players.filter({ $0.points > 0 }).count == 1 {
            self.isGameFinished = true
            return
        }
    }
}
