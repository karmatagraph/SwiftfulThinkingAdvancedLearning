//
//  CustomNavBarContainerView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by karma on 7/1/22.
//

import SwiftUI

struct CustomNavBarContainerView<T:View>: View {
    let content: T
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    @State private var subTitle: String? =  nil
    
    init(@ViewBuilder content: ()-> T) {
        self.content = content()
    }
    
    var body: some View {
        VStack{
            CustomNavBarView(showBackButton: showBackButton, title: title, subTitle: subTitle)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self) { value in
            self.title = value
        }
        .onPreferenceChange(CustomNavBarSubTitlePreferenceKey.self) { value in
            self.subTitle = value
        }
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self) { value in
            self.showBackButton = !value
        }
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarContainerView{
            ZStack{
                Color.indigo.ignoresSafeArea()
                Text("Hello world").foregroundColor(.white)
                    .customNavigationTitle("ladf")
                    .customNavigationSubTitle("hola migente")
                    .customNavigationBarBackButtonHidden(true)
            }
        }
    }
}
