//
//  AppNavBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by karma on 7/1/22.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            ZStack{
                Color.orange.ignoresSafeArea()
                CustomNavLink {
                    Text("we are destination")
                        .customNavigationTitle("Second Screen")
                        .customNavigationSubTitle("hello again")
                } label: {
                    Text("Navigate")
                }
            }
//            .customNavBarItems(title: <#T##String#>, subtitle: <#T##String?#>, backButtonHidden: <#T##Bool#>)
            .customNavigationTitle("Very large title")
//            .customNavigationSubTitle("hello there")
            .customNavigationBarBackButtonHidden(true)
        }
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}

extension AppNavBarView {
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                NavigationLink {
                    Text("Destination")
                        .navigationTitle("nav 2 title")
                        .navigationBarBackButtonHidden(false)
                } label: {
                    Text("Navigate")
                }
            }
            .navigationTitle("nav title")
        }
    }
}
