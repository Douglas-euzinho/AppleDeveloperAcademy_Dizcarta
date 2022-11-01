//
//  ConfigurationsView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 23/09/22.
//

import SwiftUI

struct ConfigurationsView: View {
    // MARK: - VARIABLES
    @Environment(\.presentationMode) var presentation
    @StateObject var observed = Observed()
    @State var isSpeakerOn = false
    @State var isHapticsOn = false
    @State var isColorBlindnessOn = false
    
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color(.backgroundAppColor)
                .ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                HStack(spacing: 20) {
                    GenericFunctions.checkIfImageExist(name: "narrador")
                    Toggle("Narrador", isOn: $isSpeakerOn)
                        .foregroundColor(.white)
                }
                .padding()
                
                HStack(spacing: 20) {
                    GenericFunctions.checkIfImageExist(name: "haptics")
                    Toggle("Haptics", isOn: $isHapticsOn)
                        .foregroundColor(.white)
                }
                .padding()
                
                HStack(spacing: 20) {
                    GenericFunctions.checkIfImageExist(name: "color_blindness")
                    Toggle("Color Blindness", isOn: $isColorBlindnessOn)
                        .foregroundColor(.white)
                }
                .padding()
                
                HStack {
                    Button {
                        
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
                    } label: {
                        GenericFunctions.checkIfImageExist(name: "suporte")
                        Text("Ajuda e Suporte")
                            .foregroundColor(.white)
                            .padding(.leading)
                    }
                }
                .padding()
                
            }
        }
        .navigationTitle("Configurações")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                HStack {
            Image(systemName: "chevron.left")
            Text("Voltar")
                .fontWeight(.medium)
        }
            .foregroundColor(.black)
            .onTapGesture {
                self.presentation.wrappedValue.dismiss()
            }
        )
    }
}

// MARK: - PREVIEW
struct ConfigurationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationsView()
    }
}
