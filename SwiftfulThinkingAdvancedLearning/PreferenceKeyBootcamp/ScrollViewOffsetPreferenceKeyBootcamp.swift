//
//  ScrollViewOffsetPreferenceKeyBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by karma on 7/1/22.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CFloat = 0
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

extension View {
    func onScrollViewOffsetChange(action: @escaping (_ offset: CGFloat)-> Void)-> some View{
        self
            .background(
                GeometryReader {geo in
                    Text("")
                        .preference(key: ScrollViewOffsetPreferenceKey.self, value: CFloat(geo.frame(in: .global).minY))
                }
            )
            .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
                action(CGFloat(value))
            }
        
    }
}

struct ScrollViewOffsetPreferenceKeyBootcamp: View {
    let title: String = "new title here"
    @State private var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        ScrollView{
            VStack {
                titleLayer
                    .opacity(scrollViewOffset / 50)
                    .onScrollViewOffsetChange { offset in
                        self.scrollViewOffset = offset
                    }
                contentLayer
            }
        }
        .overlay(Text("\(scrollViewOffset)"))
        
        .overlay(navbarLayer
            .opacity(scrollViewOffset < 0 ? 1.0 : 0)
                 ,alignment: .top)
    }
}

extension ScrollViewOffsetPreferenceKeyBootcamp {
    private var titleLayer:some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    private var contentLayer: some View {
        ForEach(0..<100) {_ in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.opacity(0.3))
                .frame(width: 300, height: 200)
        }
    }
    private var navbarLayer: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.blue)
    }
}

struct ScrollViewOffsetPreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewOffsetPreferenceKeyBootcamp()
    }
}
