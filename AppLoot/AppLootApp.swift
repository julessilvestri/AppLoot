//
//  AppLootApp.swift
//  AppLoot
//
//  Created by Jules SILVESTRI on 1/19/24.
//

import SwiftUI

class OnBoardingViewModel: ObservableObject {
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool = false
}

@main
struct AppLootApp: App {
    @StateObject var viewModel = OnBoardingViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.isOnboardingDone {
                ContentView(viewModel: viewModel)
            } else {
                OnBoardingView(viewModel: viewModel)
            }
        }
    }
}
