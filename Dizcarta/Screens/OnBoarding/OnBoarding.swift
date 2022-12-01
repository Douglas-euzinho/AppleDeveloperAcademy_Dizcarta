//
//  OnBoarding.swift
//  Dizcarta
//
//  Created by Victor Brito on 25/11/22.
//

import SwiftUI

struct ViewOneOB: View {
    var body: some View {
        VStack {
            ZStack {
                ViewOne()
            }
        }
    }
}

struct ViewTwoOB: View {
    var body: some View {
        VStack {
            ZStack {
                ViewTwo()
            }
        }
    }
}

struct ViewThreeOB: View {
    var body: some View {
        VStack {
            ZStack {
                ViewThree()
            }
        }
    }
}
struct ViewFourOB: View {
    var body: some View {
        VStack {
            ZStack {
                ViewFour()
            }
        }
    }
}
struct ViewFiveOB: View {
    var body: some View {
        VStack {
            ZStack {
                ViewFive()
            }
        }
    }
}
struct ViewSixOB: View {
    var body: some View {
        VStack {
            ZStack {
                ViewSix()
            }
        }
    }
}

struct OnBoardingPagination: View {
    @EnvironmentObject var router: Router
    @State var selectedPage = 0
    var body: some View {
        VStack {
            GenericFunctions.checkIfImageExist(name: "divider")
            TabView(selection: $selectedPage) {
                ViewOneOB().tag(0)
                ViewTwoOB().tag(1)
                ViewThreeOB().tag(2)
                ViewFourOB().tag(3)
                ViewFiveOB().tag(4)
                ViewSixOB().tag(5)
            }
            .tabViewStyle(PageTabViewStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if selectedPage == 5 {
                            router.pushView(screen: .home)
                        }
                    } label: {
                        Text(selectedPage < 5 ? "Pular" : "Avançar")
                    }
                }
            }
            .onDisappear {
                router.popView(screen: .onboarding)
            }
        }
    }
}

struct OnBoardingView: View {
    @EnvironmentObject var router: Router
    var body: some View {
        ZStack {
            Color(.backgroundAppColor)
                .ignoresSafeArea(.all)
            VStack {
                OnBoardingPagination()
            }
        }
        .navigationTitle("Regras")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                HStack {
            Image(systemName: "chevron.left")
            Text("Voltar")
                .fontWeight(.medium)
        }
            .foregroundColor(.white)
            .onTapGesture {
                router.popView()
            }
        )
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
