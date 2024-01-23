//
//  LootIconWidget.swift
//  AppLoot
//
//  Created by Jules SILVESTRI on 1/23/24.
//

import SwiftUI

struct LootIconWidget: View {
    var quantity: Int
    var name: String
    var type: ItemType
    var rarity: Rarity
    var attackStrength: Int?
    var game: Game
    
    @State private var animationAmount: Double = 0.0
    @State private var shadowRadius: CGFloat = 0.0
    
    @State private var animationAxisX: CGFloat = 1
    @State private var animationAxisY: CGFloat = 0.5
    @State private var animationAxisZ: CGFloat = 0
    
    @State private var uniqueScale = 0.0
    @State private var uniqueOpacity = 0.0
    
    var body: some View {
        ZStack {
            Text(type.rawValue)
                .padding(20)
                .background(rarity.getColor())
                .cornerRadius(30)
                .font(.system(size: 60))
                .shadow(color: rarity.getColor(), radius: shadowRadius)
        }
        .rotation3DEffect(
            .degrees(animationAmount), axis: (x: animationAxisX, y: animationAxisY, z: animationAxisZ)
        )
        .task {
            try? await Task.sleep(nanoseconds: 1000000000)
            
            withAnimation(.spring()) {
                self.animationAmount += 360
            }
            try? await Task.sleep(nanoseconds: 1000000000)
            
            withAnimation(.bouncy()) {
                self.shadowRadius = 100.0
            }
            
        }
        .onTapGesture {
            self.animationAxisX = 0
            self.animationAxisY = 0
            self.animationAxisZ = 1
            
            withAnimation(.spring(response: 0.5, dampingFraction: 0.4, blendDuration: 1)) {
                self.animationAmount += 90
            }
        }
        
        Text(name)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(rarity.getColor())
        
        
        if case "Unique" = String(describing: rarity).capitalized {
            Text("Item Unique 🏆")
                .fontWeight(.bold)
                .padding(10)
                .background(rarity.getColor())
                .cornerRadius(10)
                .font(.system(size: 18))
                .foregroundColor(Color.white)
                .scaleEffect(uniqueScale)
                .opacity(uniqueOpacity)
                .onAppear{
                    Task{
                        try? await Task.sleep(nanoseconds: 3000000000)
                        withAnimation(.easeIn(duration: 0.5)) {
                            self.uniqueScale = 1
                            self.uniqueOpacity = 1
                        }
                    }
                }
        }
    }
}
