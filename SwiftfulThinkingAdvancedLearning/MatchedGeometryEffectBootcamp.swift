//
//  MatchedGeometryEffectBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by karma on 6/29/22.
//

import SwiftUI

struct MatchedGeometryEffectBootcamp: View {
    @State private var isClicked: Bool = false
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            if !isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 100, height: 100)
            }
            
            Spacer()
            if isClicked {
                RoundedRectangle(cornerRadius: 100)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 300, height: 200)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

struct MatchedGeometryEffectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffectExample()
    }
}

struct MatchedGeometryEffectExample: View {
    let category: [String] = ["Home", "Popular", "Saved"]
    @Namespace private var namespace2
    @State private var selected: String = ""
    var body: some View {
        HStack {
            ForEach(category, id: \.self) { text in
                ZStack(alignment: .bottom) {
                    if selected == text {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.pink)
                            .matchedGeometryEffect(id: "categoryBackground", in: namespace2)
                            .frame(width: 35, height: 10)
                            .offset(y:15)
                    }
                    Text(text)
                        .foregroundColor(selected == text ? .black : .gray)
                }
                .frame(maxWidth:.infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()){
                        selected = text
                    }
                }
            }
        }
    }
}
