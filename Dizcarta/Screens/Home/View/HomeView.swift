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
            GenericFunctions.checkIfImageExist(name: "HomeLogo")
                .padding(.bottom, 215)
            ZStack {
                GenericFunctions.checkIfImageExist(name: "LightningHome")
                    .padding(.top, 15)
            }
            .padding(.leading, 295)
            ZStack {
                GenericFunctions.checkIfImageExist(name: "LightningHomeB")
                    .padding(.bottom, 560)
            }
            .padding(.trailing, 280)
            ZStack {
                GenericFunctions.checkIfImageExist(name: "HomeDetails")
                    .rotationEffect(.degrees(9))
                    .padding(.top, 750)
            }
            .padding(.leading, 360)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
