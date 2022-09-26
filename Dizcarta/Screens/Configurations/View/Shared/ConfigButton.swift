//
//  ConfButton.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 23/09/22.
//

import SwiftUI

struct ConfigButton: View {
    // MARK: - VARIABLES
    @Binding var isPressed: Bool
    @State var icon: String = "speaker.wave.3.fill"
    @State var text: String = "Narrador"
    
    
  // MARK: - BODY
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(isPressed ? Color.configurationButtonSelected : Color.configurationButtonUnselected)
        .frame(width: 130, height: 90)
        .cornerRadius(15)
      
      VStack {
        Image(systemName: icon)
          .resizable()
          .frame(width: 33, height: 33, alignment: .center)
          .foregroundColor(isPressed ? Color.configurationButtonUnselected : Color.configurationButtonSelected)
        
        Text(text)
          .font(.system(size: 14))
          .foregroundColor(isPressed ? Color.configurationButtonUnselected : Color.configurationButtonSelected)
      }
    }
    .onTapGesture {
      isPressed.toggle()
    }
  }
}

// MARK: - PREVIEW
//struct ConfButton_Previews: PreviewProvider {
//  static var previews: some View {
//      ConfigButton(icon: "speaker.wave.3.fill", text: "Narrador")
//  }
//}
