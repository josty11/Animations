//
//  BirdView.swift
//  Animations
//
//  Created by Tatiana on 14/05/25.
//

import SwiftUI

struct BirdView: View {
    @State private var leftWing = false
    @State private var rightWing = false
    @State private var birdBody = false
    @State private var animateShadow = false
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ZStack {
                //MARK: - Left wing
                Image("leftWing")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .shadow(color: .red, radius: 1, x: 0, y: 3)
                    .rotationEffect(.degrees(leftWing ? -100 : 0), anchor: .bottomTrailing)
                    .offset(x: -55, y: leftWing ? -190 : 0)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                
                //MARK: - Right wing
                Image("rightWing")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .shadow(color: .blue, radius: 1, x: 0, y: 3)
                    .rotationEffect(.degrees(rightWing ? 100 : 0), anchor: .bottomLeading)
                    .offset(x:55, y: rightWing ? -190 : 0)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))

                //MARK: - Body
                Image("body")
                    .resizable()
                    .frame(width: 100, height: 125)
                    .offset(y: -30)
                    .shadow(color: .white, radius: 1, x: 0, y: 0)
                    .offset(y: birdBody ? -50 : 75)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))

            }
            .shadow(
                color: .white,
                radius: animateShadow ? 1 : 4,
                x: 0,
                y: animateShadow ? 10 : 1
            )
            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
            .onAppear {
                birdBody.toggle()
                leftWing.toggle()
                rightWing.toggle()
                animateShadow.toggle()
            }
        }
    }
}

#Preview {
    BirdView()
}
