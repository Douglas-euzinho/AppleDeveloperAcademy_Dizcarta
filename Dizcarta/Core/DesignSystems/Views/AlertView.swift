//
//  AlertView.swift
//  Dizcarta
//
//  Created by Igor Samoel da Silva on 29/09/22.
//  Resource: https://swiftwithmajid.com/2019/12/18/the-power-of-viewbuilder-in-swiftui/

import SwiftUI

struct AlertView<Content>: View where Content: View {
    
    let screenSize = UIScreen.main.bounds
    var isActive: Binding<Bool>
    let content: Content
    
    init(isActive: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.isActive = isActive
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            if isActive.wrappedValue {
                Color(.gray)
                    .opacity(0.5)
                    .ignoresSafeArea(.all)
            } else {}
            content
                .offset(y: isActive.wrappedValue ? 0 : screenSize.height)
        }
        .ignoresSafeArea()
    }
    
}

struct AlertView_Previews: PreviewProvider {
    @State var shown = false
    static var previews: some View {
        AlertView(isActive: .constant(false), content: {
            EmptyView()
        })
    }
}
