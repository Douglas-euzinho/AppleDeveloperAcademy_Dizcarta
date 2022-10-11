//
//  NewPlayerView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 06/10/22.
//

import SwiftUI

struct SetupMatchView: View {
    // MARK: - VARIABLES
    @Environment(\.presentationMode) var presentation
    @State var nameTextField: String = ""
    @ObservedObject var observed = Observed()
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = UIColor(Color.clear)
        UITableView.appearance().backgroundColor = UIColor(Color.clear)
    }
    
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
                                ForEach(observed.avatarData, id: \.id) { avatar in
                                    Avatar(avatar: avatar.iamge)
                                } //: FOREACH
                            } //: LAZYHSTACK
                        } //: ZSTACK
                    } //: SCROLL VIEW
                    .frame(height: 180)
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        ForEach(observed.avatarData, id: \.self) { avatar in
                            PlayerSelectedView(imagePlayer: avatar.iamge, playerName: avatar.name)
                                .frame(width: UIScreen.main.bounds.width - 5, height: 85)
                        }
                    }
                    
                    Spacer()
                    
                    NeonButton(text: "Jogar", image: .homeButton)
                    
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

//// MARK: - PREVIEW
//struct NewPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        SetupMatchView()
//    }
//}
