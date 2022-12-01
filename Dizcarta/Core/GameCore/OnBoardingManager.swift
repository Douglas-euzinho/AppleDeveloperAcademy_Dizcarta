//
//  OnBoardingManager.swift
//  Dizcarta
//
//  Created by Victor Brito on 29/11/22.
//

import Foundation
import UIKit

struct OnBoardingManager {
    static func send(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        if UserDefaults.standard.bool(forKey: UserDefaultsConfigurations.isHapticsOn.rawValue) {
            UIImpactFeedbackGenerator(style: style).impactOccurred()
            Logger(context: .haptics).log("Impact occurred \(String(describing: style))")
        }
    }
}
