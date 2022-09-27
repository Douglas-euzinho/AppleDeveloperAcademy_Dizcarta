//
//  PlayerRepository.swift
//  Dizcarta
//
//  Created by Igor Samoel da Silva on 23/09/22.
//

import Foundation
import CoreData

protocol PlayerRepositoryProtocol: AnyObject, Repository {

    func getPlayers() -> [Player]
    func createPlayer(name: String, color: String)
    
}

final class PlayerRepositoryCoreData: PlayerRepositoryProtocol {

    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getPlayers() -> [Player] {
        []
    }
    
    func createPlayer(name: String, color: String) {
        
    }
    
}

final class PlayerRepositoryMock: PlayerRepositoryProtocol {
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = PersistenceController.inMemory.container.viewContext
    }
    
    func getPlayers() -> [Player] {
        do {
            let players = try PersistenceController.inMemory.container.viewContext.fetch(Player.fetchRequest())
            print("Players fetched \(players)")
            return players
        } catch {
            return []
        }
    }
    
    func createPlayer(name: String, color: String) {
        let player = Player(context: context)
        player.name = name
        player.color = color
        player.points = 0
        player.turn = Int16(Int.random(in: 1...6))
        save()
    }
    
    func save() {
        do {
            if context.hasChanges {
                try context.save()
            }
        } catch {
            print("ERROR: Save core data player repository")
        }
    }
    
}

final class PlayerRepository {
    static func get(context: NSManagedObjectContext) -> PlayerRepositoryProtocol {
        AppConfig.isMocked ? PlayerRepositoryMock(context: context) : PlayerRepositoryCoreData(context: context)
    }
}
