//
//  FeedbackButtonPress.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 26/09/22.
//

import SwiftUI

struct FeedbackButtonPress: View {
    var selected: String
    
    init(selected: String) {
        self.selected = selected
    }
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(minWidth: 280, idealWidth: 316, maxWidth: 316, minHeight: 31, idealHeight: 31, maxHeight: 36)
                .cornerRadius(15)
                .foregroundColor(Color(.feedbackButtonSelected))
                .overlay(alignment: .center) {
                    Text("\(selected) activated!")
                }
        }
    }
}

struct FeedbackButtonPress_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackButtonPress(selected: "miau")
    }
}
