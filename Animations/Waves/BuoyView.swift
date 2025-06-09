//
//  BuoyView.swift
//  Animations
//
//  Created by Tatiana on 09/06/25.
//

import SwiftUI

struct BuoyView: View {
    @Binding var tiltForwardBackward: Bool
    @Binding var upAndDown: Bool
    @Binding var leadingAnchorAnimate: Bool
    @State private var red = 1.0
    @State private var green = 1.0
    @State private var blue = 1.0
    let cornerRadius = 8.0
    var body: some View {
        ZStack {
            Image("buoy")
                .overlay(
                    Rectangle()
                        .overlay(Color(red: red, green: green, blue: blue))
                        .frame(width: 12, height: 17)
                        .padding(.bottom, cornerRadius)
                        .cornerRadius(cornerRadius)
                        .padding(.bottom, -cornerRadius)
                        .position(x: 112.5, y: 19.5))
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: red)
            //The animation for the anchor point
                .rotationEffect(.degrees(leadingAnchorAnimate ? 7: -3), anchor: .leading)
                .animation(Animation.easeOut(duration: 0.9).repeatForever(autoreverses: true), value: leadingAnchorAnimate)
            //The animation for the tilt forward and backward
                .rotationEffect(.degrees(tiltForwardBackward ? -20 : 15))
                .animation(Animation.easeOut(duration: 1.0).delay(0.2).repeatForever(autoreverses: true), value: tiltForwardBackward)
            
            //The animation for up and down
                .offset(y: upAndDown ? -10 : 10)
        }.onAppear() {
            leadingAnchorAnimate.toggle()
            tiltForwardBackward.toggle()
            upAndDown.toggle()
            red = 0.5
            green = 0.5
            blue = 0.5
        }
    }
}

#Preview {
    BuoyView(tiltForwardBackward: .constant(true), upAndDown: .constant(true), leadingAnchorAnimate: .constant(true))
}
