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
   // @ObservedObject var observed = Observed()
    @StateObject private var gameCore = GameCore(context: PersistenceController.context, cardFile: "cards")
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = UIColor(Color.clear)
        UITableView.appearance().backgroundColor = UIColor(Color.clear)
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                Color(.homeColor)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    if !gameCore.avatarDataList.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            ZStack {
                                Image("Border")
                                    .padding()
                                
                                LazyHStack(spacing: 0) {
                                    ForEach(gameCore.avatarDataList, id: \.id) { avatar in
                                        Avatar(avatar: avatar.image, name: avatar.name, isSelection: true)
                                            .environmentObject(gameCore)
                                    } //: FOREACH
                                } //: LAZYHSTACK
                            } //: ZSTACK
                        } //: SCROLL VIEW
                        .frame(height: 180)
                    }
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(gameCore.players, id: \.self) { player in
                            PlayerSelectedView(imagePlayer: player.wrappedAvatar, playerName: player.wrappedName)
                                .frame(width: UIScreen.main.bounds.width - 5, height: 85)

                        }
                    }
                    NeonButton(text: "Jogar", image: .homeButton)
                        .opacity( (gameCore.players.count >= 4 && gameCore.players.count <= 6) ? 1.0 : 0.5)
                        .frame(width: 170, height: 61)
                    
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
                gameCore.resetMatch()
                self.presentation.wrappedValue.dismiss()
            }
        )
    }
    
    func removePlayers(at offsets: IndexSet) {
        gameCore.players.remove(atOffsets: offsets)
    }
}

//// MARK: - PREVIEW
//struct NewPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        SetupMatchView()
//    }
//}
