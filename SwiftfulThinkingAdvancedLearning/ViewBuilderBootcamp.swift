//
//  ViewBuilderBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by karma on 6/30/22.
//

import SwiftUI

struct HeaderViewRegular: View {
    let title: String
    let description: String?
    let iconName: String?
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            if let iconName = iconName {
                Image(systemName: iconName)
            }
            RoundedRectangle(cornerRadius: 5)
                .frame(height:2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct HeaderViewGeneric<T:View>: View {
    let title: String
    let content: T
    
    init(title: String, @ViewBuilder content: () -> T) {
        self.title = title
        self.content = content()
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            content
            RoundedRectangle(cornerRadius: 5)
                .frame(height:2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct CustomHStack<T:View> : View {
    let content: T
    init(@ViewBuilder content: () -> T) {
        self.content = content()
    }
    var body: some View {
        HStack {
            content
        }
    }
}

struct ViewBuilderBootcamp: View {
    var body: some View {
        VStack {
            HeaderViewRegular(title: "New Title", description: "Heloo", iconName: "heart.fill")
            HeaderViewRegular(title: "second Title", description: nil, iconName: nil)
            HeaderViewGeneric(title: "GenericTitle") {
                VStack {
                    Text("hellodim")
                    Image(systemName: "bolt.fill")
                    Circle()
                        .frame(width: 30, height: 30, alignment: .leading)
                }
                
            }
            CustomHStack {
                Text("hi")
                Text("hi")
                Text("hi")
            }
            
            Spacer()
        }
    }
}

struct ViewBuilderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalViewBuilder(type: .one)
    }
}

struct LocalViewBuilder:View {
    enum ViewType {
        case one,two,three
    }
    let type: ViewType
    var body: some View {
        VStack {
            headerSection
        }
    }
    
    @ViewBuilder private var headerSection: some View {
        switch type {
        case .one:
            viewOne
        case .two:
            viewTwo
        case .three:
            viewThree
        }
        //        if type == .one {
//            viewOne
//        }
//        else if type == .two {
//           viewTwo
//        }
//        else if type == .three {
//            viewThree
//        }
    }
    
    private var viewOne: some View {
        Text("one")
    }
    private var viewTwo: some View {
        VStack{
            Text("two")
            Image(systemName: "checkmark")
        }
    }
    private var viewThree: some View {
        Image(systemName: "heart.fill")
    }
}
