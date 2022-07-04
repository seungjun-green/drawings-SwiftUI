//
//  FlagOfTheUnitedStates.swift
//  drawings-SwiftUI
//
//  Created by SeungJun Lee on 7/5/22.
//

import SwiftUI

struct FlagOfTheUnitedStates: View {
    var body: some View {
        ZStack(alignment: .topLeading){
            Stripes()
            BlueField()
        }.scaleEffect(2.3)
    }
}


extension Int {
    var isEven: Bool { isMultiple(of: 2) }
}
