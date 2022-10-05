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
        ZStack {
            Color(.homeColor)
                .ignoresSafeArea()
            VStack(alignment: .center) {
                GenericFunctions.checkIfImageExist(name: "LogoHome")
                GenericFunctions.checkIfImageExist(name: "HomePlay")
                GenericFunctions.checkIfImageExist(name: "HomeMatches")
            }
            .overlay {
                HStack {
                    Spacer()
                }
                Spacer()
                .safeAreaInset(edge: .bottom) {
                    GenericFunctions.checkIfImageExist(name: "HomeDetailsNeon")
                        .frame(width: .infinity, height: 50)
                        .padding(.bottom)
                        Spacer()
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
