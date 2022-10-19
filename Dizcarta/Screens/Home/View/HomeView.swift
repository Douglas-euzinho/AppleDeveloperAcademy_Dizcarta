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
                    .hidden()
                    
                    VStack(alignment: .center) {
                        GenericFunctions.checkIfImageExist(name: "home_logo")
                            .frame(width: geometry.size.width/2, height: geometry.size.height/1.5)
                        Spacer()
                        NavigationLink(destination: SetupMatchView()) {
                            NeonButton(text: "Jogar", image: .neonButtonYellow)
                                .frame(width: geometry.size.width/1.2, height: geometry.size.height/7)
                        }
                        Spacer()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let devices = [ "iPhone 8", "iPhone 12", "iPhone 14", "iPhone 11 Pro Max"]
        
        ForEach(devices, id: \.self) { device in
            HomeView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
