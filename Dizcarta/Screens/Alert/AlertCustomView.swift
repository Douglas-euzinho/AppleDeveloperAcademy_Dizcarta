//
//  AlertCustomView.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 08/11/22.
//

import SwiftUI

struct AlertCustomView: View {
    @Binding var nameTextField: String
    
    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(AppColor.alertBackgroundAlertColor))
                    .overlay {
                        VStack(alignment: .center, spacing: 7) {
                            Spacer()
                            Text("Alterar nome")
                                .bold()
                                .foregroundColor(.white)
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color(AppColor.alertTextFieldAlertColor))
                                .frame(width: 220, height: 30)
                                .overlay {
                                    TextField("Nome", text: $nameTextField)
                                        .foregroundColor(.white)
                                        .font(Font(name: .primaryFont, size: 20))
                                        .textInputAutocapitalization(.words)
                                        .autocorrectionDisabled(true)
                                        .cornerRadius(10)
                                } //: Overlay 2 Rec
                                .padding(10)
                            Divider()
                                .foregroundColor(.black)
                            HStack {
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Text("Cancelar")
                                        .foregroundColor(Color(AppColor.alertTextButtonAlertColor))
                                }
                                Spacer()
                                Divider().frame(height: 35)
                                    .foregroundColor(.black)
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Text("Salvar")
                                        .foregroundColor(Color(AppColor.alertTextButtonAlertColor))
                                }
                                Spacer()
                            } //: HStack
                        } //: VStack
                        .padding(.bottom)
                    } //: Overlay 1 Rec
            } //: VStack
            .frame(width: 250, height: 150)
        } //: GeometryReader
    }
}

struct AlertCustomView_Previews: PreviewProvider {
    static var previews: some View {
        AlertCustomView(nameTextField: .constant("a"))
    }
}
