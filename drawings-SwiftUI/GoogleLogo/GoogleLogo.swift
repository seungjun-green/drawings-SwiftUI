//
//  GoogleLogo.swift
//  drawings-SwiftUI
//
//  Created by SeungJun Lee on 7/5/22.
//

import SwiftUI

struct GoogleLogo: View {
    let logoSize: CGFloat = 300
    let colors = [Color.googleBlue, Color.googleGreen, Color.googleYellow, Color.googleRed]
    var body: some View {
        ZStack{
            ForEach(0..<colors.count, id: \.self) { i in
                Google(start: Double(45 + (i-1) * 90), end: Double(45 + i * 90)).stroke(colors[i], lineWidth: logoSize * 0.2)
            }
        }.frame(width: logoSize, height: logoSize)
    }
}

struct Google: Shape {
    var start: Double
    var end: Double
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        if start == Double(-45) {
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.width * 0.9, y: rect.midX))
        }
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width * 0.4, startAngle: .degrees(start < 0 ? start+45:start), endAngle: .degrees(end), clockwise: false)
        return path
    }
}

