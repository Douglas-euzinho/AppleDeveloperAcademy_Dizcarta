//
//  PlayerList+Observed.swift
//  Dizcarta
//
//  Created by Igor Samoel da Silva on 27/09/22.
//

import Foundation
import CoreData

extension PlayerListView {
    class Observed: ObservableObject {
        @Published var repository: PlayerRepositoryProtocol
        
        init(context: NSManagedObjectContext) {
            self.repository = PlayerRepository.get(context: context)
        }
        
    }
}
