//
//  HistoryView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 26/09/22.
//

import SwiftUI

struct HistoryView: View {
  // MARK: - VARIABLES
  
  // MARK: - BODY
  var body: some View {
    VStack(alignment: .leading ,spacing: 10) {
      HistoryData(date: Date(), time: Date(), numberOfPlayers: 6, winner: "Alice")
      HistoryData(date: Date(), time: Date(), numberOfPlayers: 4, winner: "Angelina")
      HistoryData(date: Date(), time: Date(), numberOfPlayers: 6, winner: "João")
    } //: VSTACK
    .navigationTitle("Histórico")
    .navigationBarTitleDisplayMode(.large)
    .padding()
  }
}

// MARK: - PREVIEW
struct HistoryView_Previews: PreviewProvider {
  static var previews: some View {
    HistoryView()
  }
}
