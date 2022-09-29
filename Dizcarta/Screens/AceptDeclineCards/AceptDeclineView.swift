//
//  AceptDecline.swift
//  Dizcarta
//
//  Created by Victor Brito on 29/09/22.
//

import SwiftUI

struct AceptDeclineView: View {
    var body: some View {
        ZStack{
            Color.avatarColorPatina
            InGameView()
                .ignoresSafeArea()
        }
    }
}

struct AceptDecline_Previews: PreviewProvider {
    static var previews: some View {
        AceptDeclineView()
    }
}
