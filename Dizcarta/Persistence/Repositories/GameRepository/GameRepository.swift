//
//  PlayerRepository.swift
//  Dizcarta
//
//  Created by Igor Samoel da Silva on 23/09/22.
//

import Foundation
import CoreData

protocol GameRepositoryProtocol: Repository {
    var context: NSManagedObjectContext { get set }
    var turnPosition: Int { get set }
    
    func getPlayers(match: MatchInProgress) -> [Player]
    func getMatch() -> MatchInProgress
    func createPlayer(name: String, avatar: String, match: MatchInProgress)
    func createMatch()
    
    func removePlayerPoints(player: Player, points: Int)
    func addPlayerPoints(player: Player, points: Int)
    
    func getRanking(match: MatchInProgress) -> [Player]
    func removeAllMatchesInProgress()
    func resetPlayersPoints()
    
}

extension GameRepositoryProtocol {
    func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("[SAVE CORE DATA]: ERROR TO SAVE CONTEXT")
            }
        }
    }
    
    func delete(object: NSManagedObject) {
        context.delete(object)
        save()
    }
    
    func removeAllMatchesInProgress() {
        do {
            let matches = try? context.fetch(MatchInProgress.fetchRequest())
            guard let matches else { return }
            matches.forEach { match in
                delete(object: match)
            }
        }
    }
}

final class PlayerRepositoryCoreData: GameRepositoryProtocol {
    
    var turnPosition: Int = 0
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getPlayers(match: MatchInProgress) -> [Player] {
        do {
            let matches = try context.fetch(MatchInProgress.fetchRequest())
            guard let matchInProgress = matches.first(where: { $0 == match }),
                  let players = matchInProgress.players?.allObjects as? [Player] else { return []}
            print("[CORE DATA]: GET PLAYERS \(players)")
            return players
        } catch {
            print("[CORE DATA]: ERRO TO GET PLAYERS")
        }
        return []
    }
    
    func createPlayer(name: String, avatar: String, match: MatchInProgress) {
        let player = Player(context: context)
        player.name = name
        player.avatar = avatar
        player.points = Int16(AppConfig.PlayerStartPoints)
        player.turn = Int16(turnPosition)
        save()
        print("[CORE DATA]: PLAYER CREATED \(player)")
        turnPosition += 1
    }
    
    func createMatch() {
        let matchInProgress = MatchInProgress(context: context)
        matchInProgress.dizDate = Date()
        save()
    }
    
    func removePlayerPoints(player: Player, points: Int) {
        player.points -= Int16(points)
        save()
    }
    
    func addPlayerPoints(player: Player, points: Int) {
        player.points += Int16(points)
        save()
    }
    
    func getRanking(match: MatchInProgress) -> [Player] {
        getPlayers(match: match).sorted(by: { $0.points > $1.points })
    }
    
    func getMatch() -> MatchInProgress {
        let matches = try? context.fetch(MatchInProgress.fetchRequest())
        return (matches?.first!)!
    }
    
    func resetPlayersPoints() {
        
    }
    
    
}

final class PlayerRepositoryMock: GameRepositoryProtocol {
    
    var turnPosition: Int = 0
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = PersistenceController.inMemoryContext
    }
    
    func getPlayers(match: MatchInProgress) -> [Player] {
        guard let players = match.players?.allObjects as? [Player] else { return [] }
        print("[CORE DATA]: GET PLAYERS \(players)")
        return players.sorted(by: { $0.points > $1.points })
    }
    
    func createPlayer(name: String, avatar: String, match: MatchInProgress) {
        let player = Player(context: context)
        player.name = name
        player.avatar = avatar
        player.points = Int16(AppConfig.PlayerStartPoints)
        player.turn = Int16(turnPosition)
        player.matchInProgress = match
        print("[CORE DATA]: PLAYER CREATED \(player)")
        save()
        turnPosition += 1
    }
    
    func createMatch() {
        guard let matches = try? context.fetch(MatchInProgress.fetchRequest()), matches.isEmpty else { return }
        let matchInProgress = MatchInProgress(context: context)
        matchInProgress.dizDate = Date()
        save()
        Logger(context: .coreData).log("Match in Progress Created")
    }
    
    func removePlayerPoints(player: Player, points: Int) {
        player.points -= Int16(points)
        save()
    }
    
    func addPlayerPoints(player: Player, points: Int) {
        player.points += Int16(points)
        save()
    }
    
    func getRanking(match: MatchInProgress) -> [Player] {
        getPlayers(match: match).sorted(by: { $0.points > $1.points })
    }
    
    func getMatch() -> MatchInProgress {
        let matches = try? context.fetch(MatchInProgress.fetchRequest())
        return (matches?.first!)!
    }
    
    func resetPlayersPoints() {
        guard let players = getMatch().players?.allObjects as? [Player] else { return }
        players.forEach { player in
            player.points = Int16(AppConfig.PlayerStartPoints)
        }
        save()
    }
}

final class PlayerRepository {
    static func get(context: NSManagedObjectContext) -> GameRepositoryProtocol {
        AppConfig.isMocked ? PlayerRepositoryMock(context: context) : PlayerRepositoryCoreData(context: context)
    }
}
