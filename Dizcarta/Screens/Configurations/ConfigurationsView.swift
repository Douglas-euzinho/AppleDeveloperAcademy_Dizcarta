//
//  ConfigurationsView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 23/09/22.
//

import SwiftUI

struct ConfigurationsView: View {
  // MARK: - VARIABLES
  @Environment(\.presentationMode) var presentation
  @State var isMessageOn = true
  @State var pressedButtons = [false, false, false, false]
  @State var buttonState: ButtonState = .firstPresent
  
  let buttonTittles = ["Narrador", "Haptics", "Regras", "Color Blindness"]
  let buttonIcons = ["speaker.wave.3.fill", "waveform", "questionmark.app.fill", "drop.fill"]
  
  enum ButtonState {
    case firstPresent
    case inactive
    case active
    
    mutating func advanceState() {
      switch self {
        case .firstPresent:
        self = .active
        case .inactive:
        self = .active
        case .active:
        self = .inactive
      }
    }
  }
  
  // MARK: - BODY
  var body: some View {
    VStack {
      HStack {
        ForEach(0..<2) { index in
          ConfigButton(isPressed: $pressedButtons[index], icon: buttonIcons[index], text: buttonTittles[index])
            .onTapGesture {
              buttonState.advanceState()
            }
        }
      }
      .padding(.top, 50)
      
      HStack {
        ForEach(2..<4) { index in
          ConfigButton(isPressed: $pressedButtons[index], icon: buttonIcons[index], text: buttonTittles[index])
        }
      }
      .padding(.bottom, 35)
      
      ZStack {
        if pressedButtons[0] && (buttonState == .firstPresent || buttonState == .inactive) {
          FeedbackButtonPress(selected: buttonTittles[0], toggleSelectionOnButton: pressedButtons[0])
            .onDisappear {
              buttonState.advanceState()
            }
        } else if !pressedButtons[0] && buttonState == .active {
          FeedbackButtonPress(selected: buttonTittles[0], toggleSelectionOnButton: pressedButtons[0])
            .onDisappear {
              buttonState.advanceState()
            }
        }
        //        if isNarratorPressedActivated {
        //          FeedbackButtonPress(selected: , toggleSelectionOnButton: isNarratorPressedActivated)
        //        }
        //        if isHapticsPressedActivated == true {
        //          FeedbackButtonPress(selected: "Haptics", toggleSelectionOnButton: isHapticsPressedActivated)
        //        }
        //        if isRulesPressedActivated == true {
        //          FeedbackButtonPress(selected: "Regras", toggleSelectionOnButton: isRulesPressedActivated)
        //        }
        //        if isColorBlindnessPressedActivated == true {
        //          FeedbackButtonPress(selected: "Color Blindness", toggleSelectionOnButton: isColorBlindnessPressedActivated)
        //        }
        Spacer()
      }

    }
    .navigationTitle("Configurações")
    .navigationBarTitleDisplayMode(.large)
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading:
                          HStack {
      Image(systemName: "chevron.left")
      Text("Voltar")
        .fontWeight(.medium)
    }
      .foregroundColor(.black)
      .onTapGesture {
        self.presentation.wrappedValue.dismiss()
      }
    )
  }
}

// MARK: - PREVIEW
struct ConfigurationsView_Previews: PreviewProvider {
  static var previews: some View {
    ConfigurationsView()
  }
}
