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
    internal var turn: Int = 1
    var playersTurn: [Int64] = []
    
    @Published var isGameFinished = false
    @Published var playerLost: PlayerLost = PlayerLost(player: Player(), isLost: false)
    @Published var context: NSManagedObjectContext
    @Published var matchInProgress: MatchInProgress
    @Published var players: [Player] = []
    @Published var playerPlaying: Player?
    var avatarData: [AvatarData] = [AvatarData(image: "avatarBlue", name: "Azul"),
                                            AvatarData(image: "avatarRed", name: "Vermelho"),
                                            AvatarData(image: "avatarPurple", name: "Roxo"),
                                            AvatarData(image: "avatarYellow", name: "Amarelo"),
                                            AvatarData(image: "avatarPink", name: "Rosa"),
                                            AvatarData(image: "avatarTurquoise", name: "Verde")]
    var repository: GameRepositoryProtocol
    
    init(context: NSManagedObjectContext, cardFile: String) {
        self.cardFile = cardFile
        self.context = context
        self.repository = PlayerRepository.get(context: context)
        self.matchInProgress = repository.createMatch()
        Task(priority: .high) {
            if let allCards = try? await CardsManager.requestCards(cardsURL: "https://dizcarta.github.io/cards.json") {
                self.cardList = allCards
                print("ONLINE CARDS CREATED \(allCards)")
            } else {
                self.cardList = CardsManager.decodeJson(forName: cardFile)
            }
            var cards = self.cardList?.cards.shuffled() ?? []
#if DEBUG
            cards.removeSubrange(0...9)
#endif
            self.cardList?.cards = cards
        }
        print("[GAME CORE]: >>>>>>Created<<<<<")
    }
    
    deinit {
        print("[GAME CORE]: >>>>>>>> Is Deiniting <<<<<<")
    }
    
}
