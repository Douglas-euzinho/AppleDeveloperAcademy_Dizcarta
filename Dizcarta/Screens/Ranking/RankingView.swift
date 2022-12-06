//
//  RankingView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 26/09/22.
//

import SwiftUI

struct RankingView: View {
    // MARK: - VARIABLES
    @State var isFromHistory: Bool = true
    @EnvironmentObject var router: Router
    @State private var players: [Player] = []
    var body: some View {
        ZStack {
            Color(.backgroundAppColor)
                .ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                Text("Placar")
                    .font(Font(name: .dinCondensedBold, size: 34))
                    .foregroundColor(.white)
                    .padding()
                
                DotDividerView()
                    .padding()
                
                LazyVStack(alignment: .leading, spacing: -30) {
                    ForEach(players, id: \.id) { player in
                        HStack {
                            PlayerView(
                                avatar: player.wrappedAvatar,
                                name: player.wrappedName,
                                points: player.wrappedPoints,
                                playerPosition: (players.firstIndex(of: player) ?? 0) + 1, isGamePaused: true
                            )
                        } //: HStack
                        .padding(.leading)
                    }
                } //: VSTACK
                .padding(.top, -40)
                Spacer()
            }
            .onAppear {
                players = router.gameCore.getRanking()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                HStack {
            Image(systemName: "chevron.left")
            Text("Voltar")
                .fontWeight(.medium)
        }
            .foregroundColor(.white)
            .onTapGesture {
                router.popView()
            }
        )
    }
}
//
// struct RankingView_Previews: PreviewProvider {
//  static var previews: some View {
//    let devices = ["iPhone SE (3rd generation)","iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
//
//    ForEach(devices, id: \.self) { device in
//      RankingView(isFromHistory: false)
//        .previewDevice(PreviewDevice(rawValue: device))
//        .previewDisplayName(device)
//    }
//  }
// }
