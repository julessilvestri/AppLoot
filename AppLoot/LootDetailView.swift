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
        VStack{
            Text(item.type.rawValue)
                .padding(20)
                .background(item.rarity.getColor())
                .cornerRadius(30)
                .font(.system(size: 60))
                .shadow(color:item.rarity.getColor(), radius: 50)
            
            Text(item.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(item.rarity.getColor())
            if case "Unique" = String(describing: item.rarity).capitalized {
                Text("Item Unique 🏆")
                    .fontWeight(.bold)
                    .padding(10)
                    .background(item.rarity.getColor())
                    .cornerRadius(10)
                    .font(.system(size: 18))
                    .foregroundColor(Color.white)
            }
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
//                        RoundedRectangle
                        
                        Image(systemName: "rectangle.slash")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 43, height: 58)
                            .cornerRadius(4)
                            .foregroundColor(.black)
                            .background(Color.gray)
                            .opacity(0.4)
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
