//
//  Shape01View.swift
//  SwiftUIExample
//
//  Created by seven mr on 2024/8/1.
//

import SwiftUI
import UIKit

struct Shape01View: View {
    var body: some View {
        MyShape()
            .fill(.linearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width:200, height:200)
            
    }
}


struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.66979*width, y: 0))
        path.addCurve(to: CGPoint(x: 0, y: 0.53965*height), control1: CGPoint(x: 0.41386*width, y: 0), control2: CGPoint(x: 0, y: 0.27579*height))
        path.addCurve(to: CGPoint(x: 0.58724*width, y: height), control1: CGPoint(x: 0, y: 0.80351*height), control2: CGPoint(x: 0.33131*width, y: height))
        path.addCurve(to: CGPoint(x: width, y: 0.53965*height), control1: CGPoint(x: 0.84318*width, y: height), control2: CGPoint(x: width, y: 0.80351*height))
        path.addCurve(to: CGPoint(x: 0.66979*width, y: 0), control1: CGPoint(x: width, y: 0.27579*height), control2: CGPoint(x: 0.92573*width, y: 0))
        path.closeSubpath()
        return path
    }
}

#Preview {
    Shape01View()
}
