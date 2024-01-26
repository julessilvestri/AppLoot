//
//  OnBoarding.swift
//  AppLoot
//
//  Created by Jules SILVESTRI on 1/24/24.
//

import Foundation
import SwiftUI

struct OnBoardingView: View {
    @ObservedObject var viewModel: OnBoardingViewModel
    @State private var currentPage: Int = 0
    
    var body: some View {
        TabView(selection: $currentPage) {
            OnboardingPageView(title: "Gérer ses loots", description: "Ajouter facilement vos trouvailles et vos achats à votre collection personnelle.", imageName: "gym.bag", imageColor: .blue, currentPage: $currentPage, totalPages: 3, viewModel: viewModel)
                .tag(0)
            OnboardingPageView(title: "Votre WishList", description: "Créer une liste des souhaits pour garder une trace des articles que vous avez aquérit.", imageName: "wand.and.stars.inverse", imageColor: .purple, currentPage: $currentPage, totalPages: 3, viewModel: viewModel)
                .tag(1)
            OnboardingPageView(title: "En un coup d'oeil", description: "Accéder rapidement aux fonctionnalités clés depuis l'écran d'acceuil de votre appareil.", imageName: "iphone.gen1", imageColor: .yellow, currentPage: $currentPage, totalPages: 3, viewModel: viewModel)
                .tag(2)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct OnboardingPageView: View {
    var title: String
    var description: String
    var imageName: String
    var imageColor: Color
    @Binding var currentPage: Int
    var totalPages: Int
    @ObservedObject var viewModel: OnBoardingViewModel
    
    var body: some View {
        VStack{
            Spacer()
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Image(systemName: imageName)
                .padding(50)
                .foregroundColor(.white)
                .background(imageColor)
                .frame(width: 180, alignment: .center)
                .font(.system(size: 85))
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Text(description)
                .padding()
                .fontWeight(.black)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button(action: {
                if currentPage < totalPages - 1 {
                    currentPage += 1
                } else {
                    viewModel.isOnboardingDone = true
                }
            }) {
                Text(currentPage < totalPages - 1 ? "Suivant" : "Commencer")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .padding(10)
            .background(.blue)
            .cornerRadius(10)
            
            Spacer()
        }
    }
}
