//
//  Picker.swift
//  Dizcarta
//
//  Created by Victor Brito on 22/09/22.
//

import SwiftUI

struct Picker: View {
    @Binding var selectedColor: Color
    private let colors: [Color] = [Color(.avatarColorPurple),
                                   Color(.avatarColorGreen),
                                   Color(.avatarColorCopperRose),
                                   Color(.avatarColorYellow),
                                   Color(.avatarColorBlue), Color(.avatarColorPatina)]
    
    var body: some View {
        VStack {
            HStack {
                ForEach(colors[0...2], id: \.self) { color in
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
            HStack {
                ForEach(colors[3...5], id: \.self) { color in
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
}
