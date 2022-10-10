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
    // MARK: - PICKER COLOR
    case backGroundPickerColor = "background_picker_color"
    
    // MARK: - SCREENS COLOR
    case homeColor = "home_color"
    case playerListColor = "player_list_color"
    case newPlayerColor = "new_player_color"
    
    // MARK: - BUTTONS
    case configurationButtonUnselected = "configuration_button_unselected"
    case configurationButtonSelected = "configuration_button_selected"
    
    // MARK: - FEEDBACK
    case feedbackButtonSelected = "feedback_button_selected"
    
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
