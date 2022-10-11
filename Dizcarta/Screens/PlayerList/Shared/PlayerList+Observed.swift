//
//  PlayerList+Observed.swift
//  Dizcarta
//
//  Created by Igor Samoel da Silva on 27/09/22.
//

import Foundation
import CoreData

extension PlayerListView {
    class Observed: ObservableObject, PlayerRepositoryProtocol {
        
        @Published var context: NSManagedObjectContext
        @Published var matchInProgress: MatchInProgress
        @Published var players: [Player] = []
        private var repository: PlayerRepositoryProtocol
        
        init(context: NSManagedObjectContext) {
            self.context = context
            self.repository = PlayerRepository.get(context: context)
            self.matchInProgress = repository.createMatch()
        }
        
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
    }
}
