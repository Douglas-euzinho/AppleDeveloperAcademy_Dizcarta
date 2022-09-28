//
//  HistoryData.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 26/09/22.
//

import SwiftUI

struct HistoryData: View {
  // MARK: - PROPERTIES
  @State var isPresented: Bool = false
  @State var date: Date
  @State var time: Date
  @State var numberOfPlayers: Int
  @State var winner: String
  
  // MARK: - BODY
  var body: some View {
    HStack {
      VStack {
        Text("\(date.formatted(date: .numeric, time: .omitted))")
          .font(.system(size: 24, weight: .medium))
        
        Text("\(time.formatted(date: .omitted, time: .shortened))")
          .font(.system(size: 12, weight: .semibold))
      }
      .padding(.trailing, 15)
      
      VStack(alignment: .leading) {
        Text("\(numberOfPlayers) jogadores")
          .font(.system(size: 17, weight: .semibold))
        
        Text("Vencedor: \(winner)")
          .font(.system(size: 12, weight: .medium))
      }
      .padding(20)
      
      VStack {
        Text("Ver Ranking")
          .font(.system(size: 12, weight: .regular))
          .foregroundColor(.configurationButtonSelected)
          .padding(10)
          .sheet(isPresented: $isPresented) {
            RankingView(isFromHistory: true, date: Date(), time: Date())
          }
          .onTapGesture {
            isPresented.toggle()
          }
          .padding()
      } //: VSTACK
    } //: HSTACK
  }
}

// MARK: - PREVIEW
struct HistoryData_Previews: PreviewProvider {
  static var previews: some View {
    HistoryData(date: Date(), time: Date(), numberOfPlayers: 6, winner: "Alice")
  }
}
