//
//  FeedbackButtonPress.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 26/09/22.
//

import SwiftUI

struct FeedbackButtonPress: View {
  @State var showFeedbackWithOpacity: Double = 1.0
  @Binding var hideMessage: Bool
  let animation = Animation.linear(duration: 1.50)
  var selected: String
  
  var body: some View {
    VStack {
      Rectangle()
        .frame(minWidth: 280, idealWidth: 316, maxWidth: 316, minHeight: 31, idealHeight: 31, maxHeight: 36)
        .cornerRadius(20)
        .foregroundColor(Color(.feedbackButtonSelected))
        .overlay(alignment: .center) {
          Text( "\(selected)")
        }
    }
    
    .opacity(showFeedbackWithOpacity)
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        hideMessage = false
        showFeedbackWithOpacity = 0
      }
    
    }
    .animation(.easeInOut(duration: 1.5), value: hideMessage)
  }
}

struct FeedbackButtonPress_Previews: PreviewProvider {
  static var previews: some View {
    FeedbackButtonPress(hideMessage: .constant(true), selected: "miau")
  }
}
