//
//  DizcartaApp.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 19/09/22.
//

import SwiftUI

@main
struct AppCore: App {
    var body: some Scene {
        WindowGroup {
                CoordinatorView()
                    .preferredColorScheme(.dark)
                    .onAppear {
                        if UserDefaults.standard.value(forKey: UserDefaultsConfigurations.isHapticsOn.rawValue) == nil {
                            UserDefaults.standard.set(true, forKey: UserDefaultsConfigurations.isHapticsOn.rawValue)
                        }
                    }
        }
    }
}
