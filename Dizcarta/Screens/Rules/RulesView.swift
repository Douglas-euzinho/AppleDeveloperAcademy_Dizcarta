//
//  RulesView.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 21/11/22.
//

import SwiftUI

struct ViewOne: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Spacer()
                HStack {
                    Text(String(format: "0%d", 1))
                        .font(Font.custom("DINCondensed-Bold", size: 100.0, relativeTo: .title2))
                        .foregroundColor(Color(.textPlayersCount))
                    Text("Comece adicionando jogadores, lembrando que o mínimo são 4!")
                        .lineLimit(4, reservesSpace: true)
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(.white)
                }
                .padding([.leading, .trailing, .bottom])
                VStack(alignment: .center) {
                    GenericFunctions.checkIfImageExist(name: "arrow_1")
                    GenericFunctions.checkIfImageExist(name: "image_1")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                Spacer(minLength: 40)
            }
        }
    }
}

struct ViewTwo: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Spacer()
                HStack {
                    Text(String(format: "0%d", 2))
                        .font(Font.custom("DINCondensed-Bold", size: 100.0, relativeTo: .title2))
                        .foregroundColor(Color(.textPlayersCount))
                    Text("Ao iniciar a partida, todos os jogadores começarão com 15 pontos.")
                        .lineLimit(4, reservesSpace: true)
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(.white)
                }
                .padding([.leading, .trailing, .bottom])
                VStack(alignment: .center) {
                    GenericFunctions.checkIfImageExist(name: "arrow_2")
                    GenericFunctions.checkIfImageExist(name: "image_2")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                
                Spacer(minLength: 40)
            }
        }
    }
}

struct ViewThree: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Spacer()
                HStack {
                    Text(String(format: "0%d", 3))
                        .font(Font.custom("DINCondensed-Bold", size: 100.0, relativeTo: .title2))
                        .foregroundColor(Color(.textPlayersCount))
                    Text("O jogo se baseia em cartas com desafios únicos.")
                        .lineLimit(3, reservesSpace: true)
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.all)
                VStack(alignment: .center) {
                    GenericFunctions.checkIfImageExist(name: "arrow_3")
                    GenericFunctions.checkIfImageExist(name: "image_3.1")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                Spacer(minLength: 40)
            }
        }
    }
}
struct ViewFour: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Spacer()
                HStack {
                    Text(String(format: "0%d", 04))
                        .font(Font.custom("DINCondensed-Bold", size: 100.0, relativeTo: .title2))
                        .foregroundColor(Color(.textPlayersCount))
                    Text("O desafio é direcionado para o jogador da vez, o mesmo deve escolher as opções presentes na tela.")
                        .lineLimit(4, reservesSpace: true)
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(.white)
                }
                .padding([.leading, .trailing, .bottom])
                VStack(alignment: .center) {
                    GenericFunctions.checkIfImageExist(name: "arrow_4")
                    GenericFunctions.checkIfImageExist(name: "image_4")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                Spacer(minLength: 40)
            }
        }
    }
}
struct ViewFive: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Spacer()
                HStack(spacing: 20) {
                    Text(String(format: "0%d", 05))
                        .font(Font.custom("DINCondensed-Bold", size: 100.0, relativeTo: .title2))
                        .foregroundColor(Color(.textPlayersCount))
                    Text("Ao aceitar ou recusar o desafio, você ganhará ou perderá pontos!")
                        .lineLimit(4, reservesSpace: true)
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(.white)
                }
                .padding([.leading, .trailing, .bottom])
                VStack(alignment: .center) {
                    GenericFunctions.checkIfImageExist(name: "arrow_5")
                    GenericFunctions.checkIfImageExist(name: "image_5")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                Spacer(minLength: 40)
            }
        }
    }
}
struct ViewSix: View {
    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .center) {
                HStack {
                    Text(String(format: "%02d", 06))
                        .font(Font.custom("DINCondensed-Bold", size: 100.0, relativeTo: .title2))
                        .foregroundColor(Color(.textPlayersCount))
                    Text("Ganha quem ao final da partida obtiver a maior pontuação.")
                        .lineLimit(4, reservesSpace: true)
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(.white)
                }
                .padding([.leading, .trailing, .bottom])
                VStack(alignment: .center) {
                    GenericFunctions.checkIfImageExist(name: "arrow_6")
                    GenericFunctions.checkIfImageExist(name: "image_6")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                Spacer(minLength: 40)
            }
        }
    }
}

struct RulesPagination: View {
    @Binding var isOnboardingMode: Bool
    @State var selectedPage = 0
    var body: some View {
        VStack {
            GenericFunctions.checkIfImageExist(name: "divider")
            TabView(selection: $selectedPage) {
                ViewOne().tag(0)
                ViewTwo().tag(1)
                ViewThree().tag(2)
                ViewFour().tag(3)
                ViewFive().tag(4)
                ViewSix().tag(5)
            }
            .tabViewStyle(PageTabViewStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                            isOnboardingMode = false
                    } label: {
                        if isOnboardingMode {
                            Text(selectedPage < 5 ? "Pular" : "Avançar")
                                .foregroundColor(.orange)
                        }
                    }
                }
            }
        }
    }
}

struct RulesView: View {
    @Binding var isShowingOnboarding: Bool
    @EnvironmentObject var router: Router

    var body: some View {
        ZStack {
            Color(.backgroundAppColor)
                .ignoresSafeArea(.all)
            VStack {
                RulesPagination(isOnboardingMode: $isShowingOnboarding)
            }
        }
        .navigationTitle(isShowingOnboarding ? "" : "Regras")
        .navigationBarTitleDisplayMode(isShowingOnboarding ? .inline : .large)
        .navigationBarBackButtonHidden(isShowingOnboarding ? false : true)
        .navigationBarItems(leading:
                                HStack {
            if isShowingOnboarding == false {
                GenericFunctions.checkIfImageEnumExist(name: .redBackButton)
            }
        }
            .foregroundColor(.white)
            .onTapGesture {
                router.popView()
            }
        )
    }
}

// struct RulesView_Previews: PreviewProvider {
//    static var previews: some View {
//        RulesView(isShowingOnboarding: .constant(false))
//    }
// }
