//
//  HomeButtons.swift
//  Dizcarta
//
//  Created by Victor Brito on 20/09/22.
//

import SwiftUI

struct CreateButtons: View {
    
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
                .frame(minWidth: 110, maxWidth: 180, minHeight: 30, maxHeight: 110)
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
                            .font(.custom("macrofont", size: 35))
                            .minimumScaleFactor(0.01)
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
