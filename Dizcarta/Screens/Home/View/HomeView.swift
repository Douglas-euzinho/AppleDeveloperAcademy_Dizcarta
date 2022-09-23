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
                    checkIfImageExist(name: "LogoHome")
                        .resizable()
                        .frame(minWidth: 280, idealWidth: 340, maxWidth: 360, minHeight: 160, idealHeight: 192, maxHeight: 210, alignment: .center)
                        .padding(25)
                    VStack {
                        Button {
                            
                        } label: {
                            GenericButtons(label: "Jogar", image: "PlayButtonHome")
                        }
                        .padding(15)
                        
                        Button {
                            
                        } label: {
                            GenericButtons(label: "Configurações", image: "ConfigButtonHome")
                        }
                        .padding(15)
                        Button {
                            
                        } label: {
                            GenericButtons(label: "Histórico", image: "HistoryButtonHome")
                        }
                        .padding(15)
                    }
                }
            }
        }
        .ignoresSafeArea(.all)
    }
    
    func checkIfImageExist(name: String) -> Image {
        let uiImage = (UIImage(named: name) ?? UIImage(named: "MissingImage"))!
        return Image(uiImage: uiImage)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
