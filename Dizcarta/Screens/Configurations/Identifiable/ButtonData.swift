//
//  ButtonData.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 05/10/22.
//

import Foundation

struct ButtonData: Identifiable {
  var id = UUID()
  var defaultKey: String
  var title: String
  var icon: String
  var enableMessage: String
  var disableMessage: String
}
