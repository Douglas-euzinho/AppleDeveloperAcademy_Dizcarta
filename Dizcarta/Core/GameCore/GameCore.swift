//
//  GameCore.swift
//  Dizcarta
//
//  Created by Igor Samoel da Silva on 10/10/22.
//

import Foundation
import CoreData

struct PlayerLost {
    var player: Player
    var isLost: Bool
}

final class GameCore: ObservableObject {

    let cardFile: String
    var cardList: CardList?
    
    @Published var isLastCard: Bool = false
    
    @Published var playerLost: PlayerLost = PlayerLost(player: Player(), isLost: false)
    @Published var context: NSManagedObjectContext
    @Published var matchInProgress: MatchInProgress
    @Published var players: [Player] = []
    var avatarData: [AvatarData] = [AvatarData(image: "avatarBlue", name: "Blue"),
                                               AvatarData(image: "avatarRed", name: "Red"),
                                               AvatarData(image: "avatarPurple", name: "Purple"),
                                               AvatarData(image: "avatarYellow", name: "Yellow"),
                                               AvatarData(image: "avatarPink", name: "Pink"),
                                               AvatarData(image: "avatarTurquoise", name: "Turquoise")]
    var avatarDataList: [AvatarData] {
            avatarData.filter { avatar in
                !players.contains(where: { $0.wrappedAvatar == avatar.image })
            }
    }
    var repository: GameRepositoryProtocol
    
    init(context: NSManagedObjectContext, cardFile: String) {
        self.cardFile = cardFile
        self.context = context
        self.repository = PlayerRepository.get(context: context)
        self.matchInProgress = repository.createMatch()
    }
}
