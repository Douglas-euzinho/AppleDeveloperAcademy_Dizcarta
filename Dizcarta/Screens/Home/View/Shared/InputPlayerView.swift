//
//  PickColorView.swift
//  Dizcarta
//
//  Created by Victor Brito on 21/09/22.
//

import SwiftUI

struct InputPlayerView: View {
    @Environment(\.dismiss) var dismiss

    @Binding var text: String
    @State private var textFieldColor: Color = .black
    @Binding var selectedColor: Color
    var saveAction: (() -> Void) = {}

    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Rectangle()
                        .frame(width: 318, height: 350, alignment: .center)
                        .cornerRadius(20)
                        .foregroundColor(Color.backGroundPickerColor)
                }
                
                Circle()
                    .frame(width: 80, height: 80, alignment: .center)
                    .foregroundColor(selectedColor)
                    .padding(.bottom, 230)
                
                Image(systemName: "person")
                    .font(.custom("macrofont", size: 60))
                    .padding(.bottom, 230)
                
                VStack {
                    TextField("Nome", text: $text)
                }
                .frame(width: 240, height: 20)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 13)
                    .stroke(textFieldColor, lineWidth: 1))
                .padding(65)
                .padding(.top, -75)
                
                Picker(selectedColor: $selectedColor)
                    .padding(.top, 60)
                GenericButtons(label: "Salvar")
                    .frame(width: 120, height: 40)
                    .padding(.top, 220)
                    .onTapGesture {
                        saveAction()
                    }
            }
        }
    }
}

struct InputPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        InputPlayerView(text: .constant(""), selectedColor: .constant(.avatarColorBlue))
    }
}
