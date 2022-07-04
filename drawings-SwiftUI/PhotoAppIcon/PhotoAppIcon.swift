//
//  PhotoAppIcon.swift
//  drawings-SwiftUI
//
//  Created by SeungJun Lee on 7/5/22.
//

import SwiftUI

struct PhotoAppIcon: View {

    let colors = [Color.appleGren1, Color.appleGreen2, Color.appleBlue, Color.applePurple,Color.applePink, Color.appleRed, Color.appleOrange, Color.appleYellow]
    
    var body: some View {
        
        ZStack(alignment: Alignment.center) {
            
            Rectangle()
                .fill(.white)
                .frame(width: 274, height: 274)
                .cornerRadius(30)
                .shadow(color: .black, radius: 5)
            
            
            ForEach(0..<colors.count, id: \.self) { i in
                Rectangle()
                    .fill(colors[i]).frame(width: 107, height: 75).cornerRadius(100)
                    .blendMode(BlendMode.multiply)
                    .offset(x:63.5)
                    .rotationEffect(.degrees(Double(i*45)))
                 
            }
            
        }
    }
}
