//
//  RulesView.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 21/11/22.
//

import SwiftUI

struct ViewOne: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(String(format: "0%d", 1))
                    .font(Font.custom("DINCondensed-Bold", size: 100.0, relativeTo: .title2))
                    .foregroundColor(Color(.textPlayersCount))
                Text("Adicione os jogadores. No mínimo 3 no máximo 6.")
                    .lineLimit(4, reservesSpace: true)
                    .font(.system(size: 22))
                    .bold()
                    .foregroundColor(.white)
            }
            .padding()
            GenericFunctions.checkIfImageExist(name: "arrow_1")
            GenericFunctions.checkIfImageExist(name: "image_1")
            Spacer()
        }
    }
}

struct ViewTwo: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(String(format: "0%d", 2))
                    .font(Font.custom("DINCondensed-Bold", size: 100.0, relativeTo: .title2))
                    .foregroundColor(Color(.textPlayersCount))
                Text("Cada jogador iniciará com 3 pontos.")
                    .lineLimit(4, reservesSpace: true)
                    .font(.system(size: 22))
                    .bold()
                    .foregroundColor(.white)
            }
            .padding()
            GenericFunctions.checkIfImageExist(name: "arrow_2")
            GenericFunctions.checkIfImageExist(name: "image_2")
            Spacer()
        }
    }
}

struct ViewThree: View {
    var body: some View {
        VStack {
            HStack {
                Text(String(format: "0%d", 3))
                    .font(Font.custom("DINCondensed-Bold", size: 100.0, relativeTo: .title2))
                    .foregroundColor(Color(.textPlayersCount))
                Text("O jogo consiste em cartas e cada carta contém um desafio.")
                    .lineLimit(4, reservesSpace: true)
                    .font(.system(size: 22))
                    .bold()
                    .foregroundColor(.white)
            }
            .padding()
            GenericFunctions.checkIfImageExist(name: "arrow_3")
            GenericFunctions.checkIfImageExist(name: "image_3")
            Spacer()
        }
    }
}
struct ViewFour: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(String(format: "0%d", 04))
                    .font(Font.custom("DINCondensed-Bold", size: 100.0, relativeTo: .title2))
                    .foregroundColor(Color(.textPlayersCount))
                Text("O desafio é direcionado para um jogador em específico. Onde o jogador pode aceitar ou recusar o desafio.")
                    .lineLimit(4, reservesSpace: true)
                    .font(.system(size: 22))
                    .bold()
                    .foregroundColor(.white)
            }
            .padding()
            GenericFunctions.checkIfImageExist(name: "arrow_4")
            GenericFunctions.checkIfImageExist(name: "image_4")
            Spacer()
        }
    }
}
struct ViewFive: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(String(format: "0%d", 05))
                    .font(Font.custom("DINCondensed-Bold", size: 100.0, relativeTo: .title2))
                    .foregroundColor(Color(.textPlayersCount))
                Text("Ao aceitar fazer o desafio, o jogador ganhará pontos. Ao recusar, perderá pontos.")
                    .lineLimit(4, reservesSpace: true)
                    .font(.system(size: 22))
                    .bold()
                    .foregroundColor(.white)
            }
            .padding()
            GenericFunctions.checkIfImageExist(name: "arrow_5")
            GenericFunctions.checkIfImageExist(name: "image_5")
            Spacer()
        }
    }
}
struct ViewSix: View {
    var body: some View {
        VStack {
            HStack {
                Text(String(format: "%02d", 06))
                    .font(Font.custom("DINCondensed-Bold", size: 100.0, relativeTo: .title2))
                    .foregroundColor(Color(.textPlayersCount))
                Text("Ganha quem ao final tiver mais pontos.")
                    .lineLimit(4, reservesSpace: true)
                    .font(.system(size: 22))
                    .bold()
                    .foregroundColor(.white)
            }
            .padding()
            GenericFunctions.checkIfImageExist(name: "arrow_6")
            GenericFunctions.checkIfImageExist(name: "image_6")
            Spacer()
        }
    }
}

struct RulesPagination: View {
    var body: some View {
        VStack {
            GenericFunctions.checkIfImageExist(name: "divider")
            TabView {
                ViewOne()
                ViewTwo()
                ViewThree()
                ViewFour()
                ViewFive()
                ViewSix()
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}


struct RulesView: View {
    @EnvironmentObject var router: Router
    var body: some View {
        ZStack {
            Color(.backgroundAppColor)
                .ignoresSafeArea(.all)
            VStack {
                HStack {
                    Text("Regras")
                        .font(Font.custom("DINCondensed-Bold", size: 34))
                        .foregroundColor(.white)
                        .padding(.leading)
                    Spacer()
                }
                .padding()
                RulesPagination()
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button {
              HapticManager.send(style: .heavy)
                router.popView()
            } label: {
              GenericFunctions.checkIfImageExist(name: "exitButton")
                .colorMultiply(.white)
            }
            .padding()
          }
        }
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
