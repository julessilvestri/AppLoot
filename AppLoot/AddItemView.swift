//
//  AddItemView.swift
//  AppLoot
//
//  Created by Jules SILVESTRI on 1/19/24.
//

import SwiftUI

enum Rarity: CaseIterable {
    case common, uncommon, rare, epic, legendary, unique
}

struct AddItemView: View {
    @EnvironmentObject var inventory: Inventory
    
    @State var name = "Nom de l'objet"
    @State var rarity: Rarity = Rarity.common
    
    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            Button(action: {
            }, label: {
                Text("Ajouter")
            })
        }
    }
}

#Preview {
    AddItemView()
}
