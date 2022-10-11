//
//  NewPlayer+Observable.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 06/10/22.
//

import Foundation

extension SetupMatchView {
    class Observed: ObservableObject {
        @Published var avatarData: [String] = ["avatarRed", "avatarBlue", "avatarPink", "avatarTurquoise", "avatarPurple", "avatarYellow"]
    }
}
