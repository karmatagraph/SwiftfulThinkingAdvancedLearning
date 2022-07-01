//
//  AppTabBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by karma on 7/1/22.
//

import SwiftUI

// Generics
// ViewBuilder
// Preferencekey
// MatchedGeometryEffect

struct AppTabBarView: View {
    @State private var selection: String = "Home"
    @State private var tabSelection: TabBarItem = .home
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.blue
                .tabBarItem(tab: .home, selection: $tabSelection)
            Color.red
                .tabBarItem(tab: .favourite, selection: $tabSelection)
            Color.green
                .tabBarItem(tab: .profile, selection: $tabSelection)
            Color.mint
                .tabBarItem(tab: .settings, selection: $tabSelection)
            
        }
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppTabBarView()
    }
}

extension AppTabBarView {
    private var defaultTabView: some View {
        TabView(selection: $selection, content: {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favourites")
                }
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        })
    }
}
