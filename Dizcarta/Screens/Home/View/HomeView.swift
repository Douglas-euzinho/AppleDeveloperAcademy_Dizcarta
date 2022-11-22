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
    @EnvironmentObject var router: Router
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Color(.backgroundAppColor)
                    .ignoresSafeArea()
                ZStack {
                    Button {
                        HapticManager.send(style: .heavy)
                        router.pushView(screen: .configuration)
                    } label: {
                        ZStack {
                            Image("secondaryButton")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width / 3.4, height: UIScreen.main.bounds.height / 7)
                                .colorMultiply(.white)
                            
                            Image("cogsButton")
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.leading, 265)
                
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
                        router.pushView(screen: .setupMatch)
                    } label: {
                        NeonButton(text: "Jogar", image: .newButtonStyle)
                            .frame(width: geometry.size.width / 1.4, height: geometry.size.height / 7)
                    }
                    .accessibility(label: Text("Jogar"))
                    Spacer()

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
