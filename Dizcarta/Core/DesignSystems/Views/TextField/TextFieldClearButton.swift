//
//  TextFieldClearButton.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 10/10/22.
//

import SwiftUI

struct TextFieldClearButton: ViewModifier {
  @Binding var text: String
  
  func body(content: Content) -> some View {
    HStack {
      content
      
      if !text.isEmpty {
        Button(
          action: { self.text = "" },
          label: {
          }
        )
      }
    }
  }
}
