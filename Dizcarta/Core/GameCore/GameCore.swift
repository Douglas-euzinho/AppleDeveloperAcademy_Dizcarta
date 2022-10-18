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
    internal var turn: Int = 1
    
    @Published var playerLost: PlayerLost = PlayerLost(player: Player(), isLost: false)
    @Published var context: NSManagedObjectContext
    @Published var matchInProgress: MatchInProgress
    @Published var players: [Player] = []
    private var avatarData: [AvatarData] = [AvatarData(image: "avatarBlue", name: "Azul"),
                                               AvatarData(image: "avatarRed", name: "Vermelho"),
                                               AvatarData(image: "avatarPurple", name: "Roxo"),
                                               AvatarData(image: "avatarYellow", name: "Amarelo"),
                                               AvatarData(image: "avatarPink", name: "Rosa"),
                                               AvatarData(image: "avatarTurquoise", name: "Turquesa")]
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
