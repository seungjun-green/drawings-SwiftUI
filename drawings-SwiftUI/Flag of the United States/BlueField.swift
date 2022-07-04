//
//  BlueField.swift
//  AmericanFlag
//
//  Created by SeungJun Lee on 7/3/22.
//

import SwiftUI

struct BlueField: View {
    var body: some View {
        
        ZStack{
            Rectangle()
                .fill(.americanBlue)
                .frame(width: 99.8, height: 70)
            
            VStack(spacing: -0.8) {
                ForEach(0..<9) { i in
                    if i.isEven {
                        SixStars()
                    } else {
                        FiveStars()
                    }
                }
            }
        }
    }
}
