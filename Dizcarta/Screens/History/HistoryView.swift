//
//  HistoryView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 26/09/22.
//

import SwiftUI

struct HistoryView: View {
  // MARK: - VARIABLES
  @Environment(\.presentationMode) var presentation
  
  // MARK: - BODY
  var body: some View {
    VStack(alignment: .leading) {
      HistoryData(date: Date(), time: Date(), numberOfPlayers: 6, winner: "Alice")
      HistoryData(date: Date(), time: Date(), numberOfPlayers: 4, winner: "Angelina")
      HistoryData(date: Date(), time: Date(), numberOfPlayers: 6, winner: "João")
      Spacer()
    } //: VSTACK
    .navigationTitle("Histórico")
    .navigationBarTitleDisplayMode(.large)
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading:
      HStack {
        Image(systemName: "chevron.left")
        Text("Voltar")
          .fontWeight(.medium)
      }
      .foregroundColor(.black)
      .onTapGesture {
        self.presentation.wrappedValue.dismiss()
      }
    )
  }
}

// MARK: - PREVIEW
struct HistoryView_Previews: PreviewProvider {
  static var previews: some View {
    HistoryView()
  }
}
