//
//  Warmhole.swift
//  drawings-SwiftUI
//
//  Created by SeungJun Lee on 7/12/22.
//

import SwiftUI

struct Wormhole: View {
    let maxSize: CGFloat = 100 //radius of the biggest circle of the sphere
    let smallest = CGFloat(10) //radius of the smallest circle of the warmhole
    let counts = 50 //counts have to be even value always
    
    var mid: Double {
        Double(counts/2)
    }
    
    @State private var rotation = 0.0
    
    var body: some View {
        HStack{
            Spacer()
            HStack{
                ZStack{
                    ForEach(1..<counts, id: \.self) { index in
                        
                        Circle()
                            .stroke(.orange, lineWidth: 1)
                            .beautify(diameter: insideCurr(index: index), inside: true, rotation: rotation, color: .orange, maxSize: maxSize, mid: mid, index: index)
                        
                        
                        Circle()
                            .stroke(.purple, lineWidth: 1)
                            .beautify(diameter: outsideCurr(index: index), inside: false, rotation: rotation, color: .purple, maxSize: maxSize, mid: mid, index: index)
                    }
                }
                
                Spacer()
            }
            Spacer()
        }.preferredColorScheme(.dark)
        
        Slider(value: $rotation, in: 0...360)
    }
    
    func outsideCurr(index: Int) -> CGFloat {
        if index == Int(mid) {
            return CGFloat(2.0 * maxSize)
        } else if index < Int(mid) {
            let curr = pow(maxSize,2.0) - pow(maxSize*(Double(mid-Double(index))/mid),2.0)
            let currRadius = sqrt(curr)
            
            return CGFloat(2*currRadius)
        } else {
            let curr = pow(maxSize,2.0) - pow(maxSize*(Double(mid - Double(counts) + Double(index))/mid),2.0)
            let currRadius = sqrt(curr)
            
            return CGFloat(2*currRadius)
        }
    }
    
    
    func insideCurr(index: Int) -> CGFloat {
        let biggest = outsideCurr(index: 1)
        
        
        if index == Int(mid) {
            return smallest
        } else if index < Int(mid) {
            return CGFloat(abs(mid-Double(index))*biggest + abs(Double(index)-1)*smallest)/CGFloat(mid-1)
        } else {
            let d = counts-index
            return CGFloat(CGFloat(abs(1-Double(d)))*smallest + CGFloat(abs(Double(d)-mid))*biggest)/CGFloat(mid-1)
        }
    }
}

struct BeautifyModifier: ViewModifier {
    var diameter: CGFloat
    var inside: Bool
    var rotation: Double
    var color: Color
    var maxSize: CGFloat
    var mid: Double
    var index: Int
    func body(content: Content) -> some View {
        content
            .frame(width: diameter, height: diameter).rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0)).glowEffect(color: color, radius: 2, inside: inside).offset(x: CGFloat(maxSize/CGFloat(mid)) * CGFloat(index), y: 0)
        
    }
}

extension View {
    func glowEffect(color: Color, radius: CGFloat, inside: Bool) -> some View {
        VStack{
            if inside {
                self
                    .overlay(self.blur(radius: 4))
                    .shadow(color: color, radius: 12)
                    .shadow(color: color, radius: 12)
            } else {
                self
                    .overlay(self.blur(radius: 4))
            }
        }
    }
    
    func beautify(diameter: CGFloat, inside: Bool, rotation: Double, color: Color, maxSize: CGFloat, mid: Double, index: Int) -> some View {
        modifier(BeautifyModifier(diameter: diameter, inside: inside, rotation: rotation, color: color, maxSize: maxSize, mid: mid, index: index))
    }
    
}
