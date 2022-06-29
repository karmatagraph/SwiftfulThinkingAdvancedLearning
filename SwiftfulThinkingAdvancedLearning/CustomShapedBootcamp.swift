//
//  CustomShapedBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by karma on 6/29/22.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path {path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path {path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.midX))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Trapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))

            

        }
    }
}

struct CustomShapedBootcamp: View {
    var body: some View {
        ZStack {
//            Image("index")
//                .resizable()
//                .scaledToFit()
//            Triangle()
//            Diamond()
            Trapezoid()
//                .fill(LinearGradient(gradient: Gradient(colors: [Color.indigo,Color.mint]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                .trim(from: 0, to: 0.5)
//                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, dash: [10]))
//                .foregroundColor(.blue)
//                .clipShape(Triangle())
                .frame(width: 300, height: 100)
            
        }
    }
}

struct CustomShapedBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapedBootcamp()
    }
}
