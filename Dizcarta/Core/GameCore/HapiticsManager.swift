//
//  HapiticsManager.swift
//  Dizcarta
//
//  Created by Victor Brito on 26/10/22.
//

import SwiftUI

struct HapticFeedback: ViewModifier {
    
    private let generator: UIImpactFeedbackGenerator
    
    init(feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
        generator = UIImpactFeedbackGenerator(style: feedbackStyle)
    }
    
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                if UserDefaults.standard.bool(forKey: UserDefaultsConfigurations.isHapticsOn.rawValue) {
                    generator.impactOccurred()
                    Logger(context: .haptics).log("Impact occurred")
                }
            }
    }
}

struct HapticManager {
    static func send(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        if UserDefaults.standard.bool(forKey: UserDefaultsConfigurations.isHapticsOn.rawValue) {
            UIImpactFeedbackGenerator(style: style).impactOccurred()
            Logger(context: .haptics).log("Impact occurred \(String(describing: style))")
        }
    }
    
    static func send(style: UIImpactFeedbackGenerator.FeedbackStyle, intensity: CGFloat) {
        if UserDefaults.standard.bool(forKey: UserDefaultsConfigurations.isHapticsOn.rawValue) {
            UIImpactFeedbackGenerator(style: style).impactOccurred(intensity: intensity)
            Logger(context: .haptics).log("Impact occurred \(String(describing: style))")
        }
    }
}

extension View {
    func hapticFeedback(feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle = .heavy) -> some View {
        self.modifier(HapticFeedback(feedbackStyle: feedbackStyle))
    }
}
