//
//  Avatar.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 06/10/22.
//

import SwiftUI

struct Avatar: View {
    // MARK: - PROPERTIES
    @State var isPressed: Bool = false
    @State var avatar: String
    @State var name: String?
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            HStack {
                Image(avatar)
                    .padding((name != nil) ? 20 : -21)
                    .opacity(isPressed ? 1.0 : 0.5)
                    .onTapGesture {
                        self.isPressed.toggle()
                    }
                
                if let name {
                    Text(name)
                        .font(.system(size: 24, weight: .semibold))
                }
            }
        }
    }
}

// MARK: - BODY
struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(avatar: "avatarRed", name: "Alice")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
