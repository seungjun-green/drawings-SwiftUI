//
//  Stripes.swift
//  FlagOfTheUnitedStates
//
//  Created by SeungJun Lee on 7/3/22.
//

import SwiftUI

struct Stripes: View {
    var body: some View {
        VStack(spacing: 0){
            ForEach(0..<13) { i in
                Rectangle()
                    .fill(i.isEven ? .americanRed : .white)
                    .frame(width: 247, height: 10)
            }
        }.preferredColorScheme(.dark)
    }
}
