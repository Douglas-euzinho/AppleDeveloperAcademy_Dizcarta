//
//  ConfigurationsView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 23/09/22.
//

import SwiftUI

struct ConfigurationsView: View {
  // MARK: - VARIABLES
  
  // MARK: - BODY
  var body: some View {
    VStack {
      HStack {
        ConfigButton(icon: "speaker.wave.3.fill", text: "Narrador")
        ConfigButton(icon: "waveform", text: "Haptics")
      }
      
      HStack {
        ConfigButton(icon: "questionmark.app.fill", text: "Regras")
        ConfigButton(icon: "drop.fill", text: "Color Blindness")
      }
      
    }
    .navigationTitle("Configurações")
    .navigationBarTitleDisplayMode(.large)
  }
}

// MARK: - PREVIEW
struct ConfigurationsView_Previews: PreviewProvider {
  static var previews: some View {
    ConfigurationsView()
  }
}
