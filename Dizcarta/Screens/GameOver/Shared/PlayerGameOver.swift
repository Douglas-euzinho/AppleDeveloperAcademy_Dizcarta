//
//  PlayerGameOver.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 29/09/22.
//

import SwiftUI

struct PlayerGameOver: View {
    // MARK: - VARIABLES
    @State var name: String
    @State var avatarAsset: String
    @State var points: Int
    let podiumPosition: Int
    private let podiumAssets: [Int: String] = [
        1 : "1_place",
        2 : "2_place",
        3 : "3_place",
        4 : "4_place",
        5 : "5_place",
        6 : "6_place"
    ]
    
    // MARK: - BODY
    var body: some View {
        if podiumPosition < 4 {
            VStack {
                ZStack(alignment: .center) {
                    Image(avatarAsset)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding(-30)
                    
                    Image(podiumAssets[podiumPosition] ?? "")
                        .padding(.leading, -90)
                } //: ZSTACK
                
                Text(name)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                
                Text("\(points) pontos")
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 25)
            } //: VSTACK
        } else {
            HStack {
                Image(podiumAssets[podiumPosition] ?? "")
                
                Image(avatarAsset)
                    .resizable()
                    .frame(width: 96, height: 96)
                    .padding(-20)
                
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                    
                    Text("\(points) pontos")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
        }
    }
}

// MARK: - PREVIEW
struct PlayerGameOver_Previews: PreviewProvider {
    static var previews: some View {
        PlayerGameOver(name: "Alice", avatarAsset: "avatarRed", points: 20, podiumPosition: 4)
            .preferredColorScheme(.dark)
    }
}
