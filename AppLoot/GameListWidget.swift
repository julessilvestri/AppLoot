//
//  GameListWidget.swift
//  AppLoot
//
//  Created by Jules SILVESTRI on 1/23/24.
//

import SwiftUI


struct GameListWidget: View {
    var loot: [LootItem]
    
    var body: some View {
        VStack {
            ForEach(uniqueGames(), id: \.id) { game in
                HStack {
                    if let imageName = game.coverName {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    } else {
                        Image(systemName: "rectangle.slash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                    
                    Text(game.name)
                }
            }
        }
    }
    
    private func uniqueGames() -> [Game] {
        let uniqueGamesSet = Set(loot.map { $0.game })
        return Array(uniqueGamesSet)
    }}


