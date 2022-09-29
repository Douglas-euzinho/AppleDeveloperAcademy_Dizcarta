//
//  UIColor+Color.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 22/09/22.
//

import Foundation
import SwiftUI

extension Color {
    // MARK: - AVATARS
     public static let avatarColorPurple: Color = Color(UIColor(named: "avatarColorPurple") ?? .black)
     public static let avatarColorGreen: Color = Color(UIColor(named: "avatarColorGreen") ?? .black)
     public static let avatarColorCopperRose: Color = Color(UIColor(named: "avatarColorCopperRose") ?? .black)
     public static let avatarColorYellow: Color = Color(UIColor(named: "avatarColorYellow") ?? .black)
     public static let avatarColorBlue: Color = Color(UIColor(named: "avatarColorBlue") ?? .black)
     public static let avatarColorPatina: Color = Color(UIColor(named: "avatarColorPatina") ?? .black)
    
     // MARK: - PICKER COLOR
     public static let backGroundPickerColor: Color = Color(UIColor(named: "backGroundPickerColor") ?? .black)

     // MARK: - BUTTONS
     public static let configurationButtonUnselected: Color = Color(UIColor(named: "configurationButtonUnselected") ?? .black)
     public static let configurationButtonSelected: Color = Color(UIColor(named: "configurationButtonSelected") ?? .black)
    
    // MARK: - FEEDBACK
    public static let feedbackButtonSelected: Color = Color(UIColor(named: "feedbackButtonSelected") ?? .black)
}
