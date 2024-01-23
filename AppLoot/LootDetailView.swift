//
//  LootDetailView.swift
//  AppLoot
//
//  Created by Jules SILVESTRI on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    
    
    var item: LootItem
    
    var body: some View {
        VStack {
            LootIconWidget(
                quantity: item.quantity,
                name: item.name,
                type: item.type,
                rarity: item.rarity,
                attackStrength: item.attackStrength,
                game: item.game
            )
            
        }.frame(height: 300)
        
        List{
            Section{
                HStack{
                    if let coverName = item.game.coverName{
                        Image(coverName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 43, height: 58)
                            .cornerRadius(4)
                    } else {
                        ZStack{
                            RoundedRectangle(
                                cornerRadius: 4
                            ).fill(Color.gray)
                                .frame(width: 43, height: 58)
                                .opacity(0.4)
                            Image(systemName: "rectangle.slash")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 35)
                                .cornerRadius(4)
                                .foregroundColor(.gray)
                        }
                    }
                    Text(item.game.name)
                }
                Text("In-game : \(item.name)")
                Text("Puissance (ATQ) : \(item.attackStrength ?? 0)")
                Text("Possédé(s) : \(item.quantity)")
                Text("Rareté : \(String(describing: item.rarity).capitalized)")
            } header: {
                Text("INFORMATIONS")
            }
        }
    }
}

#Preview {
    LootDetailView(item: LootItem(quantity: 4, name: "Thunderstorm Staff", type: .dagger, rarity: .unique, attackStrength: 20, game: availableGames[0]))
}

