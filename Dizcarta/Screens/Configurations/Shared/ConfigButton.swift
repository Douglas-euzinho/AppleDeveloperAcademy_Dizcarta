//
//  ConfButton.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 23/09/22.
//

import SwiftUI

struct ConfigButton: View {
  // MARK: - VARIABLES
  @State var isPressed: Bool = false
  @State var data: ButtonData
  var action: (String) -> Void
  
  // MARK: - BODY
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(isPressed ? Color(.configurationButtonSelected) : Color(.configurationButtonUnselected))
        .frame(width: 130, height: 90)
        .cornerRadius(15)
      
      VStack {
        Image(systemName: data.icon)
          .resizable()
          .frame(width: 33, height: 33, alignment: .center)
          .foregroundColor(isPressed ? Color(.configurationButtonUnselected) : Color(.configurationButtonSelected))
        
        Text(data.title)
          .font(.system(size: 14))
          .foregroundColor(isPressed ? Color(.configurationButtonUnselected) : Color(.configurationButtonSelected))
      }
    }
    .onTapGesture {
        isPressed.toggle()
        UserDefaults.standard.set(isPressed, forKey: data.defaultKey)
        action(isPressed ? data.enableMessage : data.disableMessage)
    }
    .onAppear {
      isPressed = UserDefaults.standard.bool(forKey: data.defaultKey)
    }
  }
}

// MARK: - PREVIEW
struct ConfButton_Previews: PreviewProvider {
  static var previews: some View {
    ConfigButton(data: ButtonData(defaultKey: "Config", title: "Titutlo", icon: "Icone", enableMessage: "message", disableMessage: "Message")) { message in
      print("Tocado")
    }
  }
}
