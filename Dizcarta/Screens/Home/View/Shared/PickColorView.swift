//
//  PickColorView.swift
//  Dizcarta
//
//  Created by Victor Brito on 21/09/22.
//

import SwiftUI

struct PickColorView: View {
    @Environment(\.dismiss) var dismiss

    @State private var text: String = ""
    @State private var color: Color = Color.black
    @State private var selectedColor: Color = .avatarColorYellow

    var body: some View {
        VStack{
            ZStack{
                Color.clear
                    .ignoresSafeArea(.all)
                Rectangle()
                    .frame(width: 318, height: 350, alignment: .center)
                    .cornerRadius(20)
                    .foregroundColor(Color.backGroundPickerColor)
                
                Circle()
                    .frame(width: 80, height: 80, alignment: .center)
                    .foregroundColor(selectedColor)
                    .padding(.bottom, 230)
                
                Image(systemName: "person")
                    .font(.custom("macrofont", size: 60))
                    .padding(.bottom, 230)
                
                HStack{
                    TextField("Nome", text: $text)
                }
                .frame(width: 240, height: 20)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 13)
                    .stroke(color, lineWidth: 1))
                .padding(65)
                .padding(.top, -75)
                
                Picker(selectedColor: $selectedColor)
                    .padding(.top, 60)
            }
        }
    }
}

struct PickColorView_Previews: PreviewProvider {
    static var previews: some View {
        PickColorView()
    }
}
