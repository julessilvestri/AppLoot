//
//  AddItemView.swift
//  AppLoot
//
//  Created by Jules SILVESTRI on 1/19/24.
//

import SwiftUI

enum Rarity: CaseIterable {
    case common
    case uncommon
    case rare
    case epic
    case legendary
    case unique
    
    func getColor() -> Color {
        switch self {
        case .common:
            return Color.gray
        case .uncommon:
            return Color.green
        case .rare:
            return Color.blue
        case .epic:
            return Color.purple
        case .legendary:
            return Color.yellow
        case .unique:
            return Color.red
        }
    }
}

struct AddItemView: View {
    @EnvironmentObject var inventory: Inventory
    @Environment(\.dismiss) private var dismiss
    
    @State var name: String = ""
    @State var rarity: Rarity = Rarity.common
    @State var game: Game = Game.emptyGame
    @State var type: ItemType = ItemType.unknown
    @State var hasAttack: Bool = false
    @State var attackStrength: Int = 0
    
    @State private var quantity = 1
    
    let step = 1
    let range = 1...15
    
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
            Section {
                Picker("Jeu", selection: $game) {
                    ForEach(availableGames, id: \.self) { game in
                        Text(String(describing: game.name).capitalized)
                    }
                }
                
                Stepper(
                    value: $quantity,
                    in: range,
                    step: step
                ) {
                    Text("Combien : \(quantity)")
                }
                .padding(10)
            }
            
            Section {
                HStack {
                    Text("Types: ")
                    Spacer()
                    Text(type.rawValue)
                }
                
                Picker("Type", selection: $type) {
                    ForEach(ItemType.allCases, id: \.self) { type in
                        Text(String(describing: type.rawValue).capitalized)
                    }
                }
                .pickerStyle(PalettePickerStyle())
            }
            
            Section {
                Toggle("Item d'attaque", isOn: $hasAttack)
                if hasAttack {
                    Stepper(value: $attackStrength, in: 1...100) {
                        Text("Force d'attaque: \(attackStrength)")
                    }
                }
            }
            
            Button(action: {
                inventory.addItem(
                    quantitySelected: quantity,
                    nameSelected: name,
                    typeSelected: type,
                    raritySelected: rarity,
                    attackStrengthSelected: attackStrength,
                    gameSelected: game
                )
                dismiss()
            }, label: {
                Text("Ajouter l'objet")
            })
        }
    }
}

#Preview {
    AddItemView()
}
