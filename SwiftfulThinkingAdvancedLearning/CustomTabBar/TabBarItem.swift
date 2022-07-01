//
//  TabBarItem.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by karma on 7/1/22.
//

import Foundation
import SwiftUI

//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}

enum TabBarItem: Hashable {
    case home, favourite, profile, settings
    
    var iconName:String {
        switch self {
        case .home:
            return "house"
        case .favourite:
            return "heart"
        case .profile:
            return "person"
        case .settings:
            return "gear"
        }
    }
    
    var title:String {
        switch self {
        case .home:
            return "Home"
        case .favourite:
            return "Favourties"
        case .profile:
            return "Profile"
        case .settings:
            return "Settings"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return .red
        case .favourite:
            return .blue
        case .profile:
            return .green
        case .settings:
            return .mint
        }
    }
}

//TabBarItem(iconName: "house", title: "Home", color: .red),
//TabBarItem(iconName: "heart", title: "Favourite", color: .blue),
//TabBarItem(iconName: "person", title: "Profile", color: .green),
//TabBarItem(iconName: "gear", title: "Settings", color: .mint)
