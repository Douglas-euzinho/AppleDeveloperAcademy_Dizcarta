//
//  FeedbackButtonPress.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 26/09/22.
//

import SwiftUI

struct FeedbackButtonPress: View {
  @State var showFeedbackWithOpacity: Double = 1.0
  @State var toggleSelectionOnButton: Bool
  let animation = Animation.linear(duration: 1.50)
  var selected: String
  
  init(selected: String, toggleSelectionOnButton: Bool) {
    self.selected = selected
    self.toggleSelectionOnButton = toggleSelectionOnButton
  }
  
  var body: some View {
    VStack {
      Rectangle()
        .frame(minWidth: 280, idealWidth: 316, maxWidth: 316, minHeight: 31, idealHeight: 31, maxHeight: 36)
        .cornerRadius(20)
        .foregroundColor(Color.feedbackButtonSelected)
        .overlay(alignment: .center) {
          Text(toggleSelectionOnButton ? "\(selected) activated!" : "\(selected) deactivated!")
        }
    }
    .opacity(showFeedbackWithOpacity)
    .onAppear {
      withAnimation(animation) {
        showFeedbackWithOpacity = 0.0
      }
    }
  }
}

struct FeedbackButtonPress_Previews: PreviewProvider {
  static var previews: some View {
    FeedbackButtonPress(selected: "miau", toggleSelectionOnButton: false)
  }
}
