//
//  RecordView.swift
//  Animations
//
//  Created by Tatiana on 14/05/25.
//

import SwiftUI

struct RecordView: View {
    @Binding var degrees: Double
    @Binding var shouldAnimate: Bool
    
    var body: some View {
        Image("record")
            .resizable()
            .frame(width: 275, height: 275)
            .shadow(color: .gray, radius: 1, x: 0, y: 0)
            .rotationEffect(Angle.degrees(degrees))
            .animation(Animation.linear(duration: shouldAnimate ? 60 : 0).delay(1.5))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RecordView(degrees: .constant(2.0), shouldAnimate: .constant(true))
        .padding()
}
