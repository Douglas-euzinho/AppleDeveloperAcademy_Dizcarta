//
//  Picker.swift
//  Dizcarta
//
//  Created by Victor Brito on 22/09/22.
//

import SwiftUI

struct Picker: View {
    @Binding var selectedColor: Color
    private let colors: [Color] = [.avatarColorPurple,
                                   .avatarColorGreen,
                                   .avatarColorCopperRose,
                                   .avatarColorYellow,
                                   .avatarColorBlue, .avatarColorPatina]
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Circle()
                    .foregroundColor(color)
                    .frame(width: 45, height: 45)
                    .opacity(color == selectedColor ? 0.5 : 1.0)
                    .scaleEffect(color == selectedColor ? 1.1 : 1.0)
                    .onTapGesture {
                        selectedColor = color
                    }
            }
        }
    }
}
