//
//  CustomNavView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by karma on 7/1/22.
//

import SwiftUI

struct CustomNavView<T:View>: View {
    let content: T
    init(@ViewBuilder content: () -> T) {
        self.content = content()
    }
    var body: some View {
        NavigationView {
            CustomNavBarContainerView {
                content
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CustomNavView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView {
            Color.red.ignoresSafeArea()
        }
    }
}

extension UINavigationController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
    
}
