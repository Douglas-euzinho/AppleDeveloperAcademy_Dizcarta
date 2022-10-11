//
//  Player+Wrapped.swift
//  Dizcarta
//
//  Created by Igor Samoel da Silva on 11/10/22.
//

import Foundation

extension Player {
    var wrappedName: String {
        get {
            name ?? "Sem Nome"
        }
        set {
            name = newValue
        }
    }
    
    var wrappedPoints: Int {
        get {
            Int(points)
        }
        
        set {
            points = Int16(newValue)
        }
    }
    
    var wrappedAvatar: String {
        get {
            avatar ?? "noImage"
        }
        
        set {
            avatar = newValue
        }
    }
}
