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
  @State var date: Date
  @State var time: Date
  
  var body: some View {
    NavigationView {
      VStack {
        if isFromHistory {
          Text("\(date.formatted(date: .numeric, time: .omitted))")
            .font(.system(size: 22, weight: .medium))
          
          Text("\(time.formatted(date: .omitted, time: .shortened))")
            .font(.system(size: 12, weight: .semibold))
        }
        
        LazyVStack(alignment: .leading) {
          PlayerView(name: "Alice", avatar: "person.circle.fill", avatarColor: Color(.avatarColorPurple), points: 20)
          PlayerView(name: "Angelina", avatar: "person.circle.fill", avatarColor: Color(.avatarColorGreen), points: 13)
          PlayerView(name: "João", avatar: "person.circle.fill", avatarColor: Color(.avatarColorYellow), points: 16)
          PlayerView(name: "Zion", avatar: "person.circle.fill", avatarColor: Color(.avatarColorPatina), points: 15)
          PlayerView(name: "Lucca", avatar: "person.circle.fill", avatarColor: Color(.avatarColorBlue), points: 14)
          PlayerView(name: "Bella", avatar: "person.circle.fill", avatarColor: Color(.avatarColorCopperRose), points: 12)
          
        } //: VSTACK
        .padding(.top, 30)
        .padding(30)
        Spacer()
      }
      .navigationTitle("Ranking")
      .navigationBarTitleDisplayMode(isFromHistory ? .inline : .large)
    }
  }
}

struct RankingView_Previews: PreviewProvider {
  static var previews: some View {
    RankingView(isFromHistory: false, date: Date(), time: Date())
  }
}
