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
    // MARK: - SCREENS COLOR
    case backgroundAppColor = "background_app_color"
    case playerListColor = "player_list_color"
    case newPlayerColor = "new_player_color"
    
    // MARK: - BUTTONS
    case configurationButtonUnselected = "configuration_button_unselected"
    case configurationButtonSelected = "configuration_button_selected"
    
    // MARK: - FEEDBACK
    case feedbackButtonSelected = "feedback_button_selected"
    
    // MARK: - CARD COLOR
    case cardColor = "card_color"
    
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
