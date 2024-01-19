//
//  ContentView.swift
//  AppLoot
//
//  Created by Jules SILVESTRI on 1/19/24.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var loot: [LootItem] = [
        LootItem(quantity: 1, name: "Epée", type: .dagger, rarity: .common, attackStrength: 10, game: Game.emptyGame),
        LootItem(quantity: 2, name: "Bouclier", type: .shield, rarity: .uncommon, attackStrength: 5, game: Game.emptyGame),
        LootItem(quantity: 5, name: "Armure", type: .unknown, rarity: .rare, attackStrength: nil, game: Game.emptyGame),
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

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var inventory = Inventory()
    @State var showAddItemView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(inventory.loot, id: \.self) { item in
                    NavigationLink {
                        LootDetailView(item: item)
                    } label: {
                        HStack {
                            Circle()
                                .foregroundColor(item.rarity.getColor())
                                .frame(width: 20, height: 20)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.name)
                                    .font(.headline)
                                
                                Text("Quantity: \(item.quantity)")
                                    .font(.subheadline)
                            }
                            
                            Spacer()
                            
                            Text("\(item.type.rawValue)")
                                .font(.subheadline)
                        }}
                }
            }
            
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView().environmentObject(inventory)
            })
            .navigationBarTitle("👜 Inventaire")
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                        showAddItemView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            })
        }
    }
}

#Preview {
    ContentView()
}
