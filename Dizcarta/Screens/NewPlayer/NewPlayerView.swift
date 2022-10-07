//
//  NewPlayerView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 06/10/22.
//

import SwiftUI

struct NewPlayerView: View {
    // MARK: - VARIABLES
    @Environment(\.presentationMode) var presentation
    @State var nameTextField: String = ""
    @StateObject var observed = Observed()
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                Color(.newPlayerColor)
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        ZStack {
                            Image("Border")
                                .padding()
                            
                            LazyHStack(spacing: 0) {
                                ForEach(observed.avatarData, id: \.self) { avatar in
                                    Avatar(avatar: avatar)
                                }
                            } //: LAZYHSTACK
                        } //: ZSTACK
                    } //: SCROLL VIEW
                    
                    List {
                        EmptyView()
                    }
                    Spacer()
                    
                    GenericButtons(label: "Jogar", color: .accentColor)
                    
                } //: VSTACK
            } //: ZSTACK
        } //: NAVIGATION VIEW
        .navigationTitle("Jogadores")
        .tint(.white)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                HStack {
            Image(systemName: "chevron.left")
            Text("Voltar")
                .fontWeight(.medium)
        }
            .foregroundColor(.white)
            .onTapGesture {
                self.presentation.wrappedValue.dismiss()
            }
        )
    }
}

// MARK: - PREVIEW
struct NewPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NewPlayerView()
    }
}
