//
//  Home.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 19/09/22.
//

import SwiftUI
import CoreData

struct HomeView: View {
  @State var isPlayerListView = false
  
    var body: some View {
        NavigationView {
            Group {
                VStack {
                    Rectangle()
                        .frame(width: 352, height: 156, alignment: .center)
                        .padding(25)
                    VStack {
                        Button {
                            
                        } label: {
                            CreateButtons(label: "Jogar", image: "PlayButtonHome")
                        }
                        .padding(15)
                        
                        Button {
                            
                        } label: {
                            CreateButtons(label: "Configurações", image: "ConfigButtonHome")
                        }
                        .padding(15)
                        Button {
                            
                        } label: {
                            CreateButtons(label: "Histórico", image: "HistoryButtonHome")
                        }
                        .padding(15)
                    }
                }
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
