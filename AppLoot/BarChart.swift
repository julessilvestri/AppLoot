//
//  BarChart.swift
//  AppLoot
//
//  Created by Jules SILVESTRI on 1/23/24.
//

import SwiftUI
import Charts


struct BarChart: View {
    
    var loot: [LootItem]
    
    var body: some View {
        Chart {
            ForEach(loot, id: \.self) { data in
                BarMark(
                    x: .value("Name", data.name),
                    y: .value("Attack Strength", Double(data.attackStrength ?? 0))
                )
            }
        }
    }
}
