//
//  LootRow.swift
//  AppLoot
//
//  Created by Jules SILVESTRI on 1/23/24.

import SwiftUI

struct LootRow: View {
    
    var quantity: Int
    var name: String
    var type: ItemType
    var rarity: Rarity
    var attackStrength: Int?
    var game: Game
    
    var body: some View {
        HStack {
            Circle()
                .foregroundColor(rarity.getColor())
                .frame(width: 20, height: 20)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                
                Text("Quantity: \(quantity)")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Text("\(type.rawValue)")
                .font(.subheadline)
        }
    }
}
