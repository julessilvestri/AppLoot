//
//  ContentView.swift
//  AppLoot
//
//  Created by Jules SILVESTRI on 1/19/24.
//

import SwiftUI


class Inventory: ObservableObject {
    @Published var loot: [LootItem] = [
        LootItem(quantity: 1, name: "Epée", type: .dagger, rarity: .common, attackStrength: 10, game: availableGames[3]),
        LootItem(quantity: 2, name: "Bouclier", type: .shield, rarity: .uncommon, attackStrength: 5, game: Game.emptyGame),
        LootItem(quantity: 7, name: "Dragonbane Sword", type: .dagger, rarity: .epic, attackStrength: 15, game: availableGames[0]),
        LootItem(quantity: 4, name: "Frostbite Bow", type: .bow, rarity: .rare, attackStrength: 12, game: availableGames[1]),
        LootItem(quantity: 4, name: "Thunderstorm Staff", type: .magic, rarity: .legendary, attackStrength: 20, game: availableGames[2]),
        LootItem(quantity: 5, name: "Venomous Dagger", type: .dagger, rarity: .unique, attackStrength: 18, game: availableGames[4])
    ]
    
    func addItem(quantitySelected quantity: Int,
                 nameSelected name: String,
                 typeSelected type: ItemType,
                 raritySelected rarity: Rarity,
                 attackStrengthSelected attackStrength: Int?,
                 gameSelected game: Game) {
        loot.append(
            LootItem(
                quantity: quantity,
                name: name,
                type: type,
                rarity: rarity,
                attackStrength: attackStrength,
                game: game
            )
        )
    }
}

enum LooterFeature {
    case loot
    case wishList
    case profile
}

struct ContentView: View {
    @ObservedObject var viewModel: OnBoardingViewModel
    @State private var selectedFeature: LooterFeature = .loot
    
    var body: some View {
        TabView(selection: $selectedFeature) {
            LootView(viewModel: viewModel)
                .tabItem {
                    Label("Loot", systemImage: "bag.fill")
                }
                .tag(LooterFeature.loot)
            WishListView()
                .tabItem {
                    Label("Wishlist", systemImage: "heart.fill")
                }
                .tag(LooterFeature.wishList)
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.fill")
                }
                .tag(LooterFeature.profile)
        }
    }
}


