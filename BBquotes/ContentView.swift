//
//  ContentView.swift
//  BBquotes
//
//  Created by Aymeric Pilaert on 23/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            QuoteView()
                .tabItem {
                Label("Breaking Bad", systemImage: "tortoise")
            }
            
            Text("Better Call Soul View")
                .tabItem {
                    Label("Better Call Soul", systemImage: "briefcase")
                }
        }
        .onAppear {
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
