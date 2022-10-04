//
//  UIColor+Color.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 22/09/22.
//

import Foundation
import SwiftUI

extension Color {
    init(_ color: AppColor?) {
        self = Color(uiColor: UIColor(named: color?.rawValue ?? "notFoundColor") ?? .black)        
    }
}

enum AppColor: String, CaseIterable {
    // MARK: - AVATARS
    case avatarColorPurple
    case avatarColorGreen
    case avatarColorCopperRose
    case avatarColorYellow
    case avatarColorBlue
    case avatarColorPatina
    
    // MARK: - PICKER COLOR
    case backGroundPickerColor
    
    // MARK: - BUTTONS
    case configurationButtonUnselected
    case configurationButtonSelected
    
    // MARK: - FEEDBACK
    case feedbackButtonSelected
    
    // MARK: - NOT FOUND COLOR
    
    static func colorName(_ color: Color) -> String {
        var colorName = "emptyColor"
        allCases.forEach { appColor in
            if Color(appColor) == color {
                colorName = appColor.rawValue
            }
        }
        return colorName
    }
}
