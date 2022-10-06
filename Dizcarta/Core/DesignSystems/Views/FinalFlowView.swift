//
//  FinalFlowView.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 26/09/22.
//

import SwiftUI

struct FinalFlowView: View {
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("Por enquanto é isso!")
                .font(.largeTitle)
            Spacer()
            GenericFunctions.checkIfImageExist(name: "FaceHappy")
            Text("Estamos trabalhando arduamente em novas telas e jajá você ficará sabendo as nossas novas atualizações!")
                .font(.title3)
                .padding(20)
            Spacer()
            Text("A equipe Dizcarta agradece o seu apoio! :D")
                .font(.headline)
            Spacer()
        }
        
    }
}

struct FinalFlowView_Previews: PreviewProvider {
    static var previews: some View {
        FinalFlowView()
    }
}
