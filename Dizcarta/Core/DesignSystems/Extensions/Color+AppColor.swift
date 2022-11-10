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
  
  // MARK: - SETUP MATCH
  case textPlayersCount = "players_count_color"
  case textFieldBackgroundColor = "textfield_background_color"
  
  // MARK: - PLAYER SELECTED VIEW
  case playerListBackgroundColor = "player_list_background_color"
  
  // MARK: - ALERT
  case alertBackgroundAlertColor = "alert_background"
  case alertTextButtonAlertColor = "alert_textbutton"
  case alertTextFieldAlertColor = "alert_textfield_background"
  
  // MARK: - BUTTONS
  case configurationButtonUnselected = "configuration_button_unselected"
  case configurationButtonSelected = "configuration_button_selected"
  
  // MARK: - FEEDBACK
  case feedbackButtonSelected = "feedback_button_selected"
  
  // MARK: - CARD COLOR
  case cardColor = "card_color"
  case yellowCard = "yellow_card"
  case redCard = "red_card"
  case greenCard = "green_card"
  
  // MARK: - CARD TEXT COLOR
  case yellowTextCard = "yellow_text_card"
  case redTextCard = "red_text_card"
  case greenTextCard = "green_text_card"
  
  // MARK: - CARD BACKGROUND TEXT COLOR
  case yellowBackgroundTextCard = "yellow_background_text_card"
  case redBackgroundTextCard = "red_background_text_card"
  case greenBackgroundTextCard = "green_background_text_card"
    
 // MARK: CARD COLORS
    static func getCardColor(type: CardType) -> String {
        switch type {
        case .challenge:
            return yellowCard.rawValue
        case .surprise:
            return greenCard.rawValue
        case .loss:
            return redCard.rawValue
        }
    }
    
    static func getCardTextColor(type: CardType) -> String {
        switch type {
        case .challenge:
            return yellowTextCard.rawValue
        case .surprise:
            return greenTextCard.rawValue
        case .loss:
            return redTextCard.rawValue
        }
    }
    
    static func getBackgroundTextColor(type: CardType) -> String {
        switch type {
        case .challenge:
            return yellowBackgroundTextCard.rawValue
        case .surprise:
            return greenBackgroundTextCard.rawValue
        case .loss:
            return redBackgroundTextCard.rawValue
        }
    }
    
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
