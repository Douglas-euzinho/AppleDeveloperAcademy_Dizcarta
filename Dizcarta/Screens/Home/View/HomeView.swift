//
//  Home.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 19/09/22.
//

import SwiftUI
import CoreData
import AVFoundation

// MARK: Main view
struct HomeView: View {
    @State var isPlayerListView = false
    @State private var goToSetupGame = false
    @State private var goToConfig = false

    var body: some View {
            GeometryReader { geometry in
                NavigationStack {
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
                            
                            Button {
                                HapticManager.send(style: .heavy)
                                goToSetupGame = true
                            } label: {
                                NeonButton(text: "Jogar", image: .neonButtonYellow)
                                    .frame(width: geometry.size.width / 1.4, height: geometry.size.height / 13)
                            }
                            .accessibility(label: Text("Jogar"))
                            .padding(2)
                            
                            Button {
                                HapticManager.send(style: .heavy)
                                goToConfig = true
                            } label: {
                                NeonButton(text: "Configurações", image: .neonButtonPurple)
                                    .frame(width: geometry.size.width / 1.23, height: geometry.size.height / 9)
                            }
                            .accessibility(label: Text("Configurações"))
                            Spacer()
                        }
                        .navigationDestination(isPresented: $goToConfig) {
                            ConfigurationsView()
                        }
                    }
                    .navigationDestination(isPresented: $goToSetupGame) {
                        SetupMatchView()
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
