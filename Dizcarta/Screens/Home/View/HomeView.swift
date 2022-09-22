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
            VStack{
                Rectangle()
                    .frame(width: 352, height: 156, alignment: .center)
                    .padding(25)
                
                VStack {
                  NavigationLink(destination: PlayerListView(), isActive: $isPlayerListView) {
                    Button {
                      self.isPlayerListView = true
                    } label: {
                        CreateButtons{
                            Image(systemName: "play.fill")
                            Text("Jogar")
                        }
                        .tint(.black)
                    }
                    .padding(15)
                  }
                    
                    Button {
                        
                    } label: {
                        CreateButtons{
                            Image(systemName: "gearshape.fill")
                            Text("Configurações")
                        }
                        .tint(.black)
                    }
                    .padding(15)
                    Button {
                        
                    } label: {
                        CreateButtons{
                            Image(systemName: "clock")
                            Text("histórico")
                        }
                        .padding(15)
                    }
                   .tint(.black)
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
