//
//  HomeButtons.swift
//  Dizcarta
//
//  Created by Victor Brito on 20/09/22.
//

import SwiftUI

struct CreateButtons<Content>: View where Content: View {
    var label: Content
    var retangle: Content

#warning("fix this bug attribution")
    init(@ViewBuilder content: () -> Content) {
        self.label = content()
        self.retangle = content()
    }

    var body: some View {
        Group {
            ZStack{
                retangle
                Rectangle()
                    .frame(width: 189, height: 111, alignment: .center)
                    .cornerRadius(20)
                
                VStack{
                    label
                        .font(.custom("macrofont", size: 25))
                        .padding(5)
                        .foregroundColor(.white)
                }
            }
        }
    }
}
