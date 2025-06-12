//
//  CircleEmitter.swift
//  Animations
//
//  Created by Tatiana on 11/06/25.
//

import SwiftUI

struct CircleEmitter: View {
    @Binding var isAnimating: Bool
    var body: some View {
        Circles()
            .fill(.white.opacity(0.75))
            .scaleEffect(isAnimating ? 2 : 0)
            .animation(isAnimating ? .spring() : .easeInOut(duration: 0))
    }
}

#Preview {
    CircleEmitter(isAnimating: .constant(true))
}
