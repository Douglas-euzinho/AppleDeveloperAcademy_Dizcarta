//
//  ConfigurationsView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 23/09/22.
//

import SwiftUI

struct ConfigurationsView: View {
    // MARK: - VARIABLES
    @AppStorage(UserDefaultsConfigurations.isHapticsOn.rawValue) var isHapticsOn = true
    @AppStorage(UserDefaultsConfigurations.isNarratorOn.rawValue) var isNarratorOn = false
    @AppStorage(UserDefaultsConfigurations.isColorBlindnessOn.rawValue) var isColorBlindnessOn = false
    @EnvironmentObject var router: Router
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color(.backgroundAppColor)
                .ignoresSafeArea(.all)
            VStack(alignment: .leading) {
        
                HStack(spacing: 20) {
                    GenericFunctions.checkIfImageExist(name: "haptics")
                    Toggle("Haptics", isOn: $isHapticsOn)
                        .foregroundColor(.white)
                }
                .padding()
                
                HStack {
                    Button {
                        router.pushView(screen: .rules)
                    } label: {
                        GenericFunctions.checkIfImageExist(name: "regras")
                        Text("Regras")
                            .foregroundColor(.white)
                            .padding(.leading)
                    }
                }
                .padding()
                
                HStack {
                    Button {
                        if let supportUrl = URL(string: "https://dizcarta.github.io/#contact") {
                            UIApplication.shared.open(supportUrl)
                        }
                    } label: {
                        GenericFunctions.checkIfImageExist(name: "suporte")
                        Text("Ajuda e Suporte")
                            .foregroundColor(.white)
                            .padding(.leading)
                    }
                }
                .padding()
            }
            .padding(.top, 75)
            .navigationTitle("Ajustes")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    GenericFunctions.checkIfImageExist(name: "exitButton")
                        .onTapGesture {
                            router.goToRoot()
                        }
                }
            }
            DotDividerView()
                .padding(.top, 60)
        }
    }
    // MARK: - PREVIEW
    struct ConfigurationsView_Previews: PreviewProvider {
        static var previews: some View {
            ConfigurationsView()
        }
    }
}
