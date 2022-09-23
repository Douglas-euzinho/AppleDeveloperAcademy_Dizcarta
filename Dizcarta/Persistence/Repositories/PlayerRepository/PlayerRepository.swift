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
    var players = [Player]()
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getPlayers() -> [Player] {
        players
    }
    
    func createPlayer(name: String, color: String) {
        let player = Player()
        player.name = name
        player.color = color
        player.points = 0
        player.turn = Int16(Int.random(in: 1...6))
        players.append(player)
    }
    
    
}

final class PlayerRepository {
    static func get(context : NSManagedObjectContext) -> PlayerRepositoryProtocol {
        AppConfig.isMocked ? PlayerRepositoryMock(context: context) : PlayerRepositoryCoreData(context: context)
    }
}

