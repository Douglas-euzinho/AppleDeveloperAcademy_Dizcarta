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
                if AppConfig.isHapticsOn == true {
                    generator.impactOccurred()
                }
            }
    }
}

extension View {
    func hapticFeedback(feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle = .heavy) -> some View {
        self.modifier(HapticFeedback(feedbackStyle: feedbackStyle))
    }
}
