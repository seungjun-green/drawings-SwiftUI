//
//  ShinyDoge.swift
//  drawings-SwiftUI
//
//  Created by SeungJun Lee on 7/15/22.
//

import SwiftUI

class Doge {
    static var degree = 50.0
}

struct ShinyDoge: View {
    let colors = [Color.yellow, Color.white]
    let speed = 50.0
    
    var angle: Double {
        Doge.degree += speed
        
        if Doge.degree > 330 {
            Doge.degree = -130
        }
        return Doge.degree
    }
    
    var body: some View {
        TimelineView(.periodic(from: .now, by: 0.5)) { dd in
          Image("doge").resizable().frame(width: 80, height: 80).offset(x: angle, y: 0)
        }
                     
        TimelineView(.animation) { _ in
                    
                ZStack{
                    ForEach(0..<85) { _ in
                        let curr: Color = colors.randomElement()!
                        Rectangle().fill(curr).frame(width: 1, height: Double.random(in: 100...350)).rotation3DEffect(.degrees(Double.random(in: 1...360)), axis: (x: CGFloat.random(in: -1...1), y: CGFloat.random(in: -1...1), z: CGFloat.random(in: -1...1))).glowEffect_1(color: curr, radius: 2).blendMode(.screen)
                        
                    }
                    
                    Image("doge").resizable().frame(width: 80, height: 80)
                }
                
            }
        
        TimelineView(.periodic(from: .now, by: 0.5)) { dd in
          Image("doge").resizable().frame(width: 80, height: 80).offset(x: -angle, y: 0)
        }
    }
}

extension View {
    func glowEffect_1(color: Color, radius: CGFloat) -> some View {
        self
            .overlay(self.blur(radius: 4))
            .shadow(color: color, radius: radius)
            .shadow(color: color, radius: radius)
    }
}


