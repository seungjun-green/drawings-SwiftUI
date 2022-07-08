//
//  RotatingPropeller.swift
//  drawings-SwiftUI
//
//  Created by SeungJun Lee on 7/8/22.
//

import SwiftUI

class DD {
    static var degree = 0.0
}

struct RotatingPropeller: View {
    @State private var speed: Double = 5
    
    var angle: Double {
        DD.degree += speed
        return DD.degree
    }
    
    var body: some View {
        VStack{
            Spacer()
            
            TimelineView(.animation) { value in
                Propeller()
                    .rotationEffect(.degrees(angle))
            }
            
            Spacer()
            
            
            Slider(value: $speed, in: 0...60).padding()
        }
    }
}

struct Propeller: View {
    let width: CGFloat = 150
    let height: CGFloat = 150
    
    var body: some View {
        ZStack(alignment: .center) {
            PropellerWing()
                .offset(x: width/2, y: -height/2)
            
            PropellerWing().frame(width: width, height: height).rotationEffect(.degrees(180))
                .offset(x: -width/2, y: +height/2)
            
            Circle().fill(.black).overlay(
                Circle()
                    .stroke(Color.yellow, lineWidth: 5)
            )
                .frame(width: 40, height: 40)
            
        }
    }
}


struct PropellerWing: View {
    var body: some View {
        
        ZStack{
            Rectangle().fill(.black).frame(width: 150, height: 150)
            
            Rectangle().fill(.yellow).frame(width: 10, height: 150).offset(x: 30)
            
            Rectangle().fill(.yellow).frame(width: 10, height: 150).offset(x: 10)
        
        }
        .clipShape(Wing())
    }
}

struct Wing: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.width * 0.1, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.width * 0.38, y: rect.width * 0.85))
        path.addLine(to: CGPoint(x: rect.width * 0.84, y: rect.width * 0.31))
        path.addCurve(to: CGPoint(x: rect.width * 0.18, y: rect.height * 0.85), control1: CGPoint(x: rect.maxX, y: rect.minY), control2: CGPoint(x: rect.width * 0.23, y: rect.height * 0.75))
        path.addLine(to: CGPoint(x: rect.width * 0.1, y: rect.maxY))
        return path
    }
}


extension View {
    func glowEffect(color: Color, radius: CGFloat) -> some View {
        self
            .overlay(self.blur(radius: 4))
            .shadow(color: color, radius: radius)
            .shadow(color: color, radius: radius)
    }
}
