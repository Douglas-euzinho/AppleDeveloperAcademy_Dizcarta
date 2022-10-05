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
    
    func getPlayers() -> [Player]
    func createPlayer(name: String, avatar: String)
    
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
}

final class PlayerRepositoryCoreData: PlayerRepositoryProtocol {
    @Published var players: [Player] = []
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getPlayers() -> [Player] {
        do {
            return try context.fetch(Player.fetchRequest())
        } catch {
            print("[CORE DATA]: ERRO TO GET PLAYERS")
        }
        return []
    }
    
    func createPlayer(name: String, avatar: String) {
        let player = Player(context: context)
        player.name = name
        player.avatar = avatar
        player.points = 0
        player.turn = Int16(Int.random(in: 1...6))
        save()
    }
    
}

final class PlayerRepositoryMock: PlayerRepositoryProtocol {
    
    @Published var players: [Player] = []
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = PersistenceController.inMemoryContext
    }
    
    func getPlayers() -> [Player] {
        do {
            print("[CORE DATA]: GET PLAYERS ")
            return try context.fetch(Player.fetchRequest())
        } catch {
            print("[CORE DATA]: ERRO TO GET PLAYERS")
        }
        return []
    }
    
    func createPlayer(name: String, avatar: String) {
        let player = Player(context: context)
        player.name = name
        player.avatar = avatar
        player.points = 0
        player.turn = Int16(Int.random(in: 1...6))
        print("[CORE DATA]: PLAYER CREATED \(player)")
        save()
    }
}

final class PlayerRepository {
    static func get(context: NSManagedObjectContext) -> PlayerRepositoryProtocol {
        AppConfig.isMocked ? PlayerRepositoryMock(context: context) : PlayerRepositoryCoreData(context: context)
    }
}
