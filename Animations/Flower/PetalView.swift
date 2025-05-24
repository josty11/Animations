//
//  PetalView.swift
//  Animations
//
//  Created by Tatiana on 14/05/25.
//

import SwiftUI

struct PetalView: View {
    @Binding var petal: Bool
    var degrees: Double = 0.0
    
    var body: some View {
        Image("petal")
            .resizable()
            .frame(width: 75, height: 125)
            .rotationEffect(.degrees(petal ? degrees : degrees), anchor: .bottom)
            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: petal)
    }
}

#Preview {
    PetalView(petal: .constant(true))
}
