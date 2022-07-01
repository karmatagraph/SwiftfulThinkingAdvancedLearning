//
//  PreferenceKeyBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by karma on 7/1/22.
//

import SwiftUI

struct PreferenceKeyBootcamp: View {
    @State private var text: String = "helloworld"
    
    var body: some View {
        NavigationView {
            VStack {
                SecondaryScreen(text: text)
                    .navigationTitle("Home")
//                    .customTitle("valueee!!!")
            }
            
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self) { value in
            self.text = value
        }
        
    }
}

extension View {
    func customTitle(_ text:String) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}

struct SecondaryScreen: View {
    let text: String
    @State private var newValue: String = ""
    
    var body: some View {
        Text(text)
            .onAppear {
                getDatafromDb()
            }
            .customTitle(newValue)
    }
    func getDatafromDb() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.newValue = "new value from db"
        }
    }
}

struct PreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeyBootcamp()
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    static var defaultValue: String = ""
    
}
