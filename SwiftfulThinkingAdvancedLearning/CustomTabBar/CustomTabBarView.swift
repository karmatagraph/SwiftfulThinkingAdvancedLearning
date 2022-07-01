//
//  CustomTabBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by karma on 7/1/22.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    @Binding var selection: TabBarItem
    
    let tabs: [TabBarItem]
    var body: some View {
        VStack {
            Spacer()
            tabBarVersion2
        }
        .onChange(of: selection) { newValue in
            withAnimation {
                localSelection = newValue
            }
        }
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        .home,.favourite,.profile,.settings
    ]
    static var previews: some View {
        CustomTabBarView(localSelection: tabs.first!, selection: .constant(tabs.first!), tabs: tabs)
    }
}

extension CustomTabBarView {
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold,design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : .gray)
        .padding(.vertical,8)
        .frame(maxWidth:.infinity)
        .background(localSelection == tab ? tab.color.opacity(0.2) : .clear)
        .cornerRadius(10)
    }
    
    private func switchToTab(tab: TabBarItem) {
        selection = tab
    }
    
    private var tabBarVersion1: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding()
        .background(Color.white.edgesIgnoringSafeArea(.bottom))
    }
    
    
    
}

extension CustomTabBarView {
    private func tabView2(tab: TabBarItem) -> some View {
        
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold,design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : .gray)
        .padding(.vertical,8)
        .frame(maxWidth:.infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
    }
    
    private var tabBarVersion2: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding()
        .background(Color.white.edgesIgnoringSafeArea(.bottom))
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 5)
        .padding(.horizontal)
    }
}
