//
//  DebugMessage.swift
//  Dizcarta
//
//  Created by Igor Samoel da Silva on 08/11/22.
//

import Foundation

enum AppContext: String {
    case coreData
    case home
    case haptics
    case game
    case configurations
    case error
    case message
}

struct Logger {
    
    let context: AppContext
    
    static func log(_ message: String) {
#if DEBUG
        print("[DEBUG]: \(message)")
#endif
    }
    
    func log(_ message: String) {
#if DEBUG
        print("[\(context.rawValue.uppercased())]: \(message)")
#endif
    }
}
