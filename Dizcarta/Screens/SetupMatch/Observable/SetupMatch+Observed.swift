//
//  NewPlayer+Observable.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 06/10/22.
//

import Foundation

extension SetupMatchView {
    class Observed: ObservableObject {
        @Published var avatarData: [AvatarData] = [AvatarData(iamge: "avatarBlue", name: "Blue"),
                                                   AvatarData(iamge: "avatarRed", name: "Red"),
                                                   AvatarData(iamge: "avatarPurple", name: "Purple"),
                                                   AvatarData(iamge: "avatarYellow", name: "Yellow"),
                                                   AvatarData(iamge: "avatarPink", name: "Pink"),
                                                   AvatarData(iamge: "avatarTurquoise", name: "Turquoise")]
    }
}
