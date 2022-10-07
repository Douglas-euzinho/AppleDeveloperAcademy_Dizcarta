//
//  Home.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 19/09/22.
//

import SwiftUI
import CoreData

// MARK: Main view
struct HomeView: View {
    @State var isPlayerListView = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .top) {
                    Color(.homeColor)
                        .ignoresSafeArea()
                    VStack {
                        GenericFunctions.checkIfImageExist(name: "HomeButtonConfig")
                    }
                    .padding(.leading, 270)
                    
                    VStack(alignment: .center) {
                        GenericFunctions.checkIfImageExist(name: "HomeLogo")
                            .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                        Spacer()
                        NavigationLink(destination: PlayerListView()) {
                            NeonButton(text: "Jogar")
                        }
                            .padding(-20)
                        NeonButton(text: "Partidas")
                        Spacer()
                    }
                    .overlay {
                        HStack {
                            Spacer()
                        }
                        Spacer()
                            .safeAreaInset(edge: .bottom) {
                                GenericFunctions.checkIfImageExist(name: "HomeDetailsNeon")
                                    .frame(height: 50)
                                    .padding(.bottom)
                                Spacer()
                            }
                    }
                }
                .padding(.all, 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
