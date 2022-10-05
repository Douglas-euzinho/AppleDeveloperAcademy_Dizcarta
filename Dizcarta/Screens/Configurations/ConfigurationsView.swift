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
  @State var isMessageOn = false
  @State var messageToShow: String = ""
  @StateObject var observed = Observed()
  
  // MARK: - BODY
  var body: some View {
    VStack {
      HStack {
        // TODO: - FIX THE FAST ACTIVATE AND DEACTIVATE THE BUTTONS LOGIC
        ForEach(0..<2) { data in
          ConfigButton(data: observed.buttonsData[data]) { message in
            self.isMessageOn = true
            self.messageToShow = message
          }
        }
      }
      .padding(.top, 50)
      
      HStack {
        ForEach(2..<4) { data in
          ConfigButton(data: observed.buttonsData[data]) { message in
            self.isMessageOn = true
            self.messageToShow = message
          }
        }
      }
      .padding(.bottom, 35)
      
      ZStack {
        if isMessageOn {
          FeedbackButtonPress(hideMessage: $isMessageOn, selected: messageToShow)
        }
      }
      Spacer()
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
