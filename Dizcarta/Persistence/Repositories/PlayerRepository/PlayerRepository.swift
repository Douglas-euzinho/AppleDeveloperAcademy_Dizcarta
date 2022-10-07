//
//  PlayerRepository.swift
//  Dizcarta
//
//  Created by Igor Samoel da Silva on 23/09/22.
//

import Foundation
import CoreData

protocol PlayerRepositoryProtocol: AnyObject, Repository {
    var context: NSManagedObjectContext { get set}
    
    func getPlayers(match: MatchInProgress) -> [Player]
    func createPlayer(name: String, avatar: String, match: MatchInProgress)
    func createMatch() -> MatchInProgress
    
}

extension PlayerRepositoryProtocol {
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
}

final class PlayerRepositoryCoreData: PlayerRepositoryProtocol {
    @Published var players: [Player] = []
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getPlayers(match: MatchInProgress) -> [Player] {
        do {
            return try context.fetch(Player.fetchRequest())
        } catch {
            print("[CORE DATA]: ERRO TO GET PLAYERS")
        }
        return []
    }
    
    func createPlayer(name: String, avatar: String, match: MatchInProgress) {
        let player = Player(context: context)
        player.name = name
        player.avatar = avatar
        player.points = 0
        player.turn = Int16(Int.random(in: 1...6))
        save()
    }
    
    func createMatch() -> MatchInProgress {
        let matchInProgress = MatchInProgress(context: context)
        matchInProgress.dizDate = Date()
        save()
        return matchInProgress
    }
    
}

final class PlayerRepositoryMock: PlayerRepositoryProtocol {
    
    @Published var players: [Player] = []
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = PersistenceController.inMemoryContext
    }
    
    func getPlayers(match: MatchInProgress) -> [Player] {
        do {
            print("[CORE DATA]: GET PLAYERS ")
            let matches = try context.fetch(MatchInProgress.fetchRequest())
            return matches.first!.players?.allObjects as! [Player]
        } catch {
            print("[CORE DATA]: ERRO TO GET PLAYERS")
        }
        return []
    }
    
    func createPlayer(name: String, avatar: String, match: MatchInProgress) {
        let player = Player(context: context)
        player.name = name
        player.avatar = avatar
        player.points = 0
        player.turn = Int16(Int.random(in: 1...6))
        print("[CORE DATA]: PLAYER CREATED \(player)")
        save()
    }
    
    func createMatch() -> MatchInProgress {
        let matchInProgress = MatchInProgress(context: context)
        matchInProgress.dizDate = Date()
        save()
        return matchInProgress
    }
    
}

final class PlayerRepository {
    static func get(context: NSManagedObjectContext) -> PlayerRepositoryProtocol {
        AppConfig.isMocked ? PlayerRepositoryMock(context: context) : PlayerRepositoryCoreData(context: context)
    }
}
