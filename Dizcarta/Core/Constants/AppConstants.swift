//
//  AppConstants.swift
//  Dizcarta
//
//  Created by Igor Samoel da Silva on 18/10/22.
//

import Foundation

enum AppConfig {
    static var isMocked = true
    static var PlayerStartPoints = 15
    static var MaxPlayerInMatch = 6
    
    #if DEBUG
    static var onlySpecialCards = false
    static var useRemoteCards = false
    #else
    static var onlySpecialCards = false
    static var useRemoteCards = true
    #endif
}

enum UserDefaultsConfigurations: String {
    case isHapticsOn
    case isNarratorOn
    case isColorBlindnessOn
}
