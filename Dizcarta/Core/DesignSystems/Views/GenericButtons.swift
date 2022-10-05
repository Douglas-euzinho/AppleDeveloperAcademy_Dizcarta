//
//  GenericButtons.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 23/09/22.
//

import SwiftUI

struct GenericButtons: View {
    
    var label: String?
    var color: Color?
    var image: String?
    
    init(label: String? = nil, color: Color? = .black, image: String? = nil) {
        self.label = label
        self.color = color
        self.image = image
    }
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(minWidth: 104, maxWidth: 233, minHeight: 33, maxHeight: 63)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .foregroundColor(color)
                .overlay {
                    VStack {
                        if image?.isEmpty == false {
                            Spacer(minLength: 10)
                            GenericFunctions.checkIfImageExist(name: image!)
                                .frame(width: 41, height: 38)
                        }
                        Text(self.label ?? "")
                            .font(.custom("macrofont", size: 35))
                            .minimumScaleFactor(0.001)
                            .padding(5)
                            .foregroundColor(.white)
                    }
                }
        }
    }
}

struct GenericButtons_Previews: PreviewProvider {
    static var previews: some View {
        GenericButtons(label: "opamaaaddd")
    }
}
