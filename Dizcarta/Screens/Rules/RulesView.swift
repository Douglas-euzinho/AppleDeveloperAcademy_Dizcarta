//
//  RulesView.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 21/11/22.
//

import SwiftUI

struct ViewOne: View {
    var body: some View {
        GeometryReader { geometry in
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
                .padding([.leading, .bottom])
                VStack(alignment: .center) {
                    GenericFunctions.checkIfImageExist(name: "arrow_1")
                        .resizable()
                        .frame(width: geometry.size.width/4, height: geometry.size.height/8)
                    GenericFunctions.checkIfImageExist(name: "image_1")
                        .resizable()
                        .frame(width: geometry.size.width/1.2, height: geometry.size.height/3)
                }
                .padding([.leading])
                Spacer(minLength: 40)
            }
        }
    }
}

struct ViewTwo: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    Text(String(format: "0%d", 2))
                        .font(Font.custom("DINCondensed-Bold", size: 100.0, relativeTo: .title2))
                        .foregroundColor(Color(.textPlayersCount))
                    Text("Ao iniciar a partida, todos os jogadores terão 15 pontos iniciais.")
                        .lineLimit(4, reservesSpace: true)
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(.white)
                }
                .padding([.leading, .bottom])
                VStack(alignment: .center) {
                    GenericFunctions.checkIfImageExist(name: "arrow_2")
                        .resizable()
                        .frame(width: geometry.size.width/8, height: geometry.size.height/6)
                    GenericFunctions.checkIfImageExist(name: "image_2")
                        .resizable()
                        .frame(width: geometry.size.width/1.2, height: geometry.size.height/4)
                }
                .padding([.leading])
                
                Spacer(minLength: 40)
            }
        }
    }
}

struct ViewThree: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                //                Spacer()
                HStack {
                    Text(String(format: "0%d", 3))
                        .font(Font.custom("DINCondensed-Bold", size: 100.0, relativeTo: .title2))
                        .foregroundColor(Color(.textPlayersCount))
                    Text("O jogo se baseia em desafios, cada carta contém um desafio único.")
                        .lineLimit(4, reservesSpace: true)
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.all)
                VStack(alignment: .center) {
                    GenericFunctions.checkIfImageExist(name: "arrow_3")
                        .resizable()
                        .frame(width: geometry.size.width/6, height: geometry.size.height/8)
                    GenericFunctions.checkIfImageExist(name: "image_3")
                        .resizable()
                        .frame(width: geometry.size.width/1.2, height: geometry.size.height/1.6)
                }
                .padding(.top, -30)
                Spacer(minLength: 40)
            }
        }
    }
}
struct ViewFour: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    Text(String(format: "0%d", 04))
                        .font(Font.custom("DINCondensed-Bold", size: 100.0, relativeTo: .title2))
                        .foregroundColor(Color(.textPlayersCount))
                    Text("O desafio é direcionado para o jogador da vez. E o mesmo deve escolher as opções presentes na tela.")
                        .lineLimit(4, reservesSpace: true)
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(.white)
                }
                .padding([.leading, .bottom])
                VStack(alignment: .center) {
                    GenericFunctions.checkIfImageExist(name: "arrow_4")
                        .resizable()
                        .frame(width: geometry.size.width/6, height: geometry.size.height/8)
                    GenericFunctions.checkIfImageExist(name: "image_4")
                        .resizable()
                        .frame(width: geometry.size.width/1.2, height: geometry.size.height/4)
                }
                .padding(.bottom)
                Spacer(minLength: 40)
            }
        }
    }
}
struct ViewFive: View {
    var body: some View {
        GeometryReader { geometry in
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
                .padding([.leading, .bottom])
                VStack(alignment: .center) {
                    GenericFunctions.checkIfImageExist(name: "arrow_5")
                        .resizable()
                        .frame(width: geometry.size.width/4, height: geometry.size.height/9)
                    GenericFunctions.checkIfImageExist(name: "image_5")
                        .resizable()
                        .frame(width: geometry.size.width/1.2, height: geometry.size.height/2)
                        .padding([.leading, .trailing])
                }
                .padding(.top, -20)
                Spacer(minLength: 40)
            }
        }
    }
}
struct ViewSix: View {
    var body: some View {
        GeometryReader { geometry in
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
                .padding([.leading, .trailing], 30)
                VStack(alignment: .center) {
                    GenericFunctions.checkIfImageExist(name: "arrow_6")
                        .resizable()
                        .frame(width: geometry.size.width/5, height: geometry.size.height/10)
                    GenericFunctions.checkIfImageExist(name: "image_6")
                        .resizable()
                        .frame(width: geometry.size.width/1.4, height: geometry.size.height/1.5)
                }
                .padding(.top, -70)
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
                Image(systemName: "chevron.left")
                Text("Voltar")
                    .fontWeight(.medium)
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
