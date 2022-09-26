//
//  ConfigurationsView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 23/09/22.
//

import SwiftUI

struct ConfigurationsView: View {
  // MARK: - VARIABLES
    @State var isNarratorPressed: Bool
    @State var isHapticsPressed: Bool
    @State var isRulesPressed: Bool
    @State var isColorBlindnessPressed: Bool
    
    @State var isMessageOn = true

  // MARK: - BODY
  var body: some View {
    VStack {
      HStack {
        ConfigButton(isPressed: $isNarratorPressed, icon: "speaker.wave.3.fill", text: "Narrador")
        ConfigButton(isPressed: $isHapticsPressed, icon: "waveform", text: "Haptics")
      }
      
      HStack {
        ConfigButton(isPressed: $isRulesPressed, icon: "questionmark.app.fill", text: "Regras")
        ConfigButton(isPressed: $isColorBlindnessPressed, icon: "drop.fill", text: "Color Blindness")
      }
        
        if isNarratorPressed == true {
            FeedbackButtonPress(selected: "Narrador")
        }
        if isHapticsPressed == true {
            FeedbackButtonPress(selected: "Haptics")
        }
        if isRulesPressed == true {
            FeedbackButtonPress(selected: "Regras")
        }
        if isColorBlindnessPressed == true {
            FeedbackButtonPress(selected: "Color Blindness")
        }
    }
    .navigationTitle("Configurações")
    .navigationBarTitleDisplayMode(.large)
  }
}

// MARK: - PREVIEW
struct ConfigurationsView_Previews: PreviewProvider {
  static var previews: some View {
      ConfigurationsView(isNarratorPressed: false, isHapticsPressed: false, isRulesPressed: false, isColorBlindnessPressed: false)
  }
}
