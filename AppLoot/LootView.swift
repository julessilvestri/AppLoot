//
//  LootView.swift
//  AppLoot
//
//  Created by Jules SILVESTRI on 1/26/24.
//

import SwiftUI

struct LootView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var inventory = Inventory()
    @State var showAddItemView = false
    @ObservedObject var viewModel: OnBoardingViewModel
    
    var body: some View {
        NavigationStack {
            List {
                Section{
                    Button(action: {
                        viewModel.isOnboardingDone = false
                    }, label: {
                        Text("Réinitialiser OnBoarding")
                    })
                }
                
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
                }.onDelete(perform: { indexSet in
                    inventory.loot.remove(atOffsets: indexSet)
                })
                
                
                Section{
                    BarChart(loot: inventory.loot)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                        .padding()
                } header: {
                    Text("STATISTIQUES")
                }
                
                Section{
                    ScrollView(.horizontal){
                        HStack{
                            GameListWidget(loot: inventory.loot)
                        }
                    }
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
