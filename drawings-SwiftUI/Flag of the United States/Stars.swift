//
//  Stars.swift
//  FlagOfTheUnitedStates
//
//  Created by SeungJun Lee on 7/3/22.
//

import SwiftUI

struct Star: View {
    var body: some View {
        Image(systemName: "star.fill")
            .resizable()
            .foregroundColor(.white).frame(width: 8, height: 8)
    }
}

struct SixStars: View {
    var body: some View {
        HStack{
            ForEach(0..<13) { i in
                if i.isEven {
                    Spacer()
                } else {
                    Star()
                }
            }
        }.frame(width: 91.42)
    }
}

struct FiveStars: View {
    var body: some View {
        HStack {
            ForEach(0..<11) { i in
                if i.isEven {
                    Spacer()
                } else {
                    Star()
                }
            }
        }.frame(width: 75.04)
    }
}
