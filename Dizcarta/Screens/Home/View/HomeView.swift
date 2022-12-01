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
                
                VStack(alignment: .center) {
                    GenericFunctions.checkIfImageExist(name: "home_logo")
                        .frame(width: geometry.size.width/2, height: geometry.size.height/1.5)
                        .overlay {
                            VStack(alignment: .trailing) {
                                Button {
                                    router.pushView(screen: .configuration)
                                } label: {
                                  VStack {
                                    ZStack {
                                      Image("secondaryButton2")
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.height / 10)
                                        .colorMultiply(.white)
                                      
                                        Image("cogsButton")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                          .foregroundColor(.white)
                                    }
                                  }
                                }
                            }
                            .position(x: geometry.size.width/1.8, y: geometry.size.height/20)
                        }
                    Spacer()
                    
                    Button {
                        HapticManager.send(style: .heavy)
                        router.pushView(screen: .setupMatch)
                    } label: {
                        NeonButton(text: "Jogar", image: .redPrimaryButton, font: .dinCondensedBold, size: 34)
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
