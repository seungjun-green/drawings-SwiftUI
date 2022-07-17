//
//  AbstractArt1.swift
//  drawings-SwiftUI
//
//  Created by SeungJun Lee on 7/17/22.
//

import SwiftUI

struct AbstractArt1: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .purple, .red]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            Stars()
            
            CirclePart().rotationEffect(.degrees(-90)).offset(x: 0, y: 300)
            
            Metros()

            Ground()
        }

    }
}

struct Stars: View {
    let a: Double = -200
    var body: some View {
        VStack{
            ForEach(0..<15, id: \.self) { _ in
                Circle().fill(.white).frame(width: 5, height: 5).offset(x: Double.random(in: -650...650), y: Double.random(in: -450...a))
                
            }
        }
    }
}



struct Ground: View {
    var body: some View {
        
        ZStack{
            
            
            VStack(spacing: 10){
                Spacer()
                ForEach(0..<5, id: \.self) { _ in
                    Rectangle().fill(LinearGradient(gradient: Gradient(colors: [.white, .white, .red, .white, .white]), startPoint: .trailing, endPoint: .leading)).frame(width: 1400, height: 3)
                }
                
                Rectangle().frame(width: 10, height: 50)
               
                
               
                
                
            }.ignoresSafeArea()
            
            
            VStack{
                Spacer()
                Center().fill(.black).frame(width: 100, height: 150)
                Rectangle().frame(width: 10, height: 50)
            }.ignoresSafeArea()
            
            VStack{
                Spacer()
                TheGround().fill(.darkPurple).frame(width: 1400, height: 50)
            }.ignoresSafeArea()
            
            
            
            
           
            
        }
        
    }
}
struct Metros: View {
    var body: some View {
        VStack{
            Metro().fill(LinearGradient(gradient: Gradient(colors: [.white, .red]), startPoint: .trailing, endPoint: .leading)).frame(width: 200, height: 10).offset(x: 50, y: 80)
            
            Metro().fill(LinearGradient(gradient: Gradient(colors: [.white, .red]), startPoint: .trailing, endPoint: .leading)).frame(width: 300, height: 10).offset(x: -100, y: 100)
            
            Metro().fill(LinearGradient(gradient: Gradient(colors: [.white, .red]), startPoint: .trailing, endPoint: .leading)).frame(width: 190, height: 10).offset(x: -400, y: -230)
            
        }
    }
}
struct CirclePart: View {
    var body: some View {
        ZStack{
            
            Circle().stroke(LinearGradient(gradient: Gradient(colors: [.pink, .orange, .white]), startPoint: .top, endPoint: .bottom),lineWidth: 6)
                .frame(width: 800, height: 800)
            
            Circle().stroke(LinearGradient(gradient: Gradient(colors: [.pink, .red, .orange, .yellow, .white]), startPoint: .top, endPoint: .bottom),lineWidth: 6)
                .frame(width: 780, height: 780)
            
            Circle().stroke(LinearGradient(gradient: Gradient(colors: [.orange, .white, .yellow, .orange]), startPoint: .top, endPoint: .bottom),lineWidth: 6)
                .frame(width: 700, height: 700)
            
            
            Circle().stroke(LinearGradient(gradient: Gradient(colors: [.red, .pink, .red]), startPoint: .top, endPoint: .bottom),lineWidth: 25)
                .frame(width: 640, height: 640)
        }
    }
}


struct Metro: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY-2))
        path.addArc(center: CGPoint(x: rect.maxX, y: rect.midY), radius: 2, startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: false)
        path.addLine(to: CGPoint(x: 0, y: rect.midY))
        return path
    }
}



extension ShapeStyle where Self == Color {
    static var darkPurple: Color {
        Color(red: 66/255, green: 28/255, blue: 82/255)
    }
}




struct TheGround: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.maxY-100))
        path.addLine(to: CGPoint(x: 100, y: rect.maxY-100))
        path.addLine(to: CGPoint(x: 100, y: rect.maxY-80))
        path.addLine(to: CGPoint(x: 190, y: rect.maxY-70))
        path.addLine(to: CGPoint(x: rect.maxX-200, y: rect.maxY-70))
        path.addLine(to: CGPoint(x: rect.maxX-150, y: rect.maxY-90))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY-150))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        return path
    }
}

struct Center: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.height*0.3))
        path.addLine(to: CGPoint(x: rect.width*0.65, y: 0))
        path.addLine(to: CGPoint(x: rect.width*0.35, y: 0))
        path.addLine(to: CGPoint(x: 0, y: rect.height*0.3))
        path.closeSubpath()
        return path
    }
}
