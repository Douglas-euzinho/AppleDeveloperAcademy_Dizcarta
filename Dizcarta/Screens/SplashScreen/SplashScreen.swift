//
//  SplashScreen.swift
//  Dizcarta
//
//  Created by Victor Brito on 26/09/22.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isRotated = false

    let shared = GenericFunctions()

    var body: some View {
        ZStack{
            shared.checkIfImageExist(name: "LogoHome")
                .resizable()
                .frame(minWidth: 280, idealWidth: 340, maxWidth: 360, minHeight: 160, idealHeight: 192, maxHeight: 210, alignment: .center)
        }
    }
}

struct ContentView : View {
    @State var splashScreen  = true
    
    var body: some View {
        ZStack{
            Group{
                if splashScreen {
                    SplashScreen()
                }
                else{
                    HomeView()
                }
            }
            .onAppear {
                DispatchQueue
                    .main
                    .asyncAfter(deadline:
                            .now() + 3) {
                                splashScreen = false
                            }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
