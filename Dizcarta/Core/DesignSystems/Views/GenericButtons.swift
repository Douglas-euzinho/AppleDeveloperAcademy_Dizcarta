//
//  GenericButtons.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 23/09/22.
//

import SwiftUI

struct GenericButtons: View {
    
    var label: String?
    var color: String?
    var image: String?

    init(label: String? = nil, color: String? = nil, image: String? = nil) {
        self.label = label
        self.color = color
        self.image = image
    }
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(minWidth: 70, idealWidth: 100, maxWidth: 180, minHeight: 20, idealHeight: 30, maxHeight: 110)
                .cornerRadius(20)
                .foregroundColor(.black)
                .overlay {
                    VStack {
                        if image?.isEmpty == false {
                            Spacer(minLength: 10)
                            checkIfImageExist(name: image!)
                                .frame(width: 41, height: 38)
                        }
                        Text(self.label ?? "")
                            .frame(minWidth: 50, idealWidth: 63, maxWidth: 80, minHeight: 20, idealHeight: 24, maxHeight: 30)
                            .font(.custom("macrofont", size: 35))
                            .minimumScaleFactor(0.001)
                            .padding(5)
                            .foregroundColor(.white)
                    }
                }
        }
    }
    
    func checkIfImageExist(name: String) -> Image {
        let uiImage = (UIImage(named: name) ?? UIImage(named: "MissingImage"))!
        return Image(uiImage: uiImage)
    }
}

struct GenericButtons_Previews: PreviewProvider {
    static var previews: some View {
        GenericButtons()
    }
}
