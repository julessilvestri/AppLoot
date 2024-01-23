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
                        LootRow(
                            quantity: item.quantity,
                            name: item.name,
                            type: item.type,
                            rarity: item.rarity,
                            attackStrength: item.attackStrength,
                            game: item.game
                        )
                    }
                }
                
                
                Section{
                    BarChart(loot: inventory.loot)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                        .padding()
                } header: {
                    Text("STATISTIQUES")
                }
                
                Section{
                    GameListWidget(loot: inventory.loot)
                } header: {
                    Text("VOS JEUX")
                }
            }
            
            
            NavigationLink {
                DragNDropDotsView()
            } label: {
                Text("DragAndDrop")
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


