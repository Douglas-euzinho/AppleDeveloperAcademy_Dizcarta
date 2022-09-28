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
    var players: [Player] { get set }
    
    func getPlayers()
    func createPlayer(name: String, color: String)
    
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
    
    internal func getPlayers() {
        do {
            let players = try context.fetch(Player.fetchRequest())
            self.players = players
        } catch {
            save()
        }
    }
    
    func createPlayer(name: String, color: String) {
        let player = Player(context: context)
        player.name = name
        player.color = color
        player.points = 0
        player.turn = Int16(Int.random(in: 1...6))
        save()
        getPlayers()
    }
    
}

final class PlayerRepositoryMock: PlayerRepositoryProtocol {
    
    @Published var players: [Player] = []
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = PersistenceController.inMemoryContext
    }
    
    internal func getPlayers() {
        do {
            let players = try context.fetch(Player.fetchRequest())
            self.players = players
        } catch {
            save()
        }
    }
    
    func createPlayer(name: String, color: String) {
        let player = Player(context: context)
        player.name = name
        player.color = color
        player.points = 0
        player.turn = Int16(Int.random(in: 1...6))
        save()
        getPlayers()
    }
}

final class PlayerRepository {
    static func get(context: NSManagedObjectContext) -> PlayerRepositoryProtocol {
        AppConfig.isMocked ? PlayerRepositoryMock(context: context) : PlayerRepositoryCoreData(context: context)
    }
}
