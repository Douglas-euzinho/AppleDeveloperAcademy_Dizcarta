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
                    Color(.backgroundAppColor)
                        .ignoresSafeArea()
                    VStack {
                        GenericFunctions.checkIfImageExist(name: "home_button_leaderboard")
                            .padding(.trailing, -30)
                            .padding(.top, +20)
                    }
                    .padding(.leading, 270)
                    
                    VStack(alignment: .center) {
                        Spacer()
                        GenericFunctions.checkIfImageExist(name: "home_logo")
                            .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                        Spacer(minLength: 100)
                        NavigationLink(destination: SetupMatchView()) {
                            NeonButton(text: "Jogar", image: .homeButton)
                        }
                            .padding(-20)
                        
                        NeonButton(text: "Configurações", image: .configButton)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
