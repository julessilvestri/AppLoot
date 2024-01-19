//
//  ContentView.swift
//  AppLoot
//
//  Created by Jules SILVESTRI on 1/19/24.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var loot = ["Epée", "Bouclier", "Armure"]
    
    func addItem(item: String) {
        loot.append(item)
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    @State var showAddItemView = false

    var body: some View {
        NavigationStack {
            List {
                Button(action: {
                    inventory.addItem(item: "Magie de feu")
                }, label: {
                    Text("Ajouter")
                })
                ForEach(inventory.loot, id: \.self) { item in
                    Text(item)
                }
            }
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView().environmentObject(Inventory())
                })
            .navigationBarTitle("Loot")
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
