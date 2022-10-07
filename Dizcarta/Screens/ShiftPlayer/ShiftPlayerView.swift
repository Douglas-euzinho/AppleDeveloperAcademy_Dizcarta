//
//  ShiftPlayerView.swift
//  Dizcarta
//
//  Created by Victor Brito on 28/09/22.
//

import SwiftUI

struct ShiftPlayerView: View {
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea(.all)
                
            VStack {
                VStack {
                    Text("Agora é a vez de:")
                        .padding(15)
                    Text("Nome do player")
                        .font(.largeTitle)
                }
                .padding(.bottom, 25)
                GenericButtons(label: "Embaralhar")
                    .frame(width: 251, height: 46)
                    .shadow(radius: 10)
            }
        }
    }
}

struct ShiftPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftPlayerView()
    }
}
