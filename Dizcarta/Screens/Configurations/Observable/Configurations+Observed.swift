//
//  ConfigurationsObservable.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 05/10/22.
//

import Foundation

extension ConfigurationsView {
  class Observed: ObservableObject {
    @Published var buttonsData: [ButtonData] = [
      ButtonData(
        defaultKey: "storyteller",
        title: "Narrador",
        icon: "speaker.wave.3.fill",
        enableMessage: "O Narrador está ativado!",
        disableMessage: "O Narrador está desativado!"
      ),
      ButtonData(
        defaultKey: "haptics",
        title: "Haptics",
        icon: "waveform",
        enableMessage: "Os Haptics estão ativados!",
        disableMessage: "Os Haptics estão desativados!"
      ),
      ButtonData(
        defaultKey: "rules",
        title: "Regres",
        icon: "questionmark.app.fill",
        enableMessage: "Mostrando as regras!",
        disableMessage: "Fechando as regras!"
      ),
      ButtonData(
        defaultKey: "colorblindness",
        title: "Modo Daltonico",
        icon: "drop.fill",
        enableMessage: "O Modo Daltonico está ativado!",
        disableMessage: "O Modo Daltinico está desativado!"
      )
    ]
  }
}
