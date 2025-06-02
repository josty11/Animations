//
//  StarsView.swift
//  Animations
//
//  Created by Tatiana on 02/06/25.
//

import SwiftUI

struct StarsView: View {
    @State private var animateYellow = false
    @State private var animateBlue = false
    @State private var animateRed = false
    @State private var animatePurple = false
    @State private var animateGreen = false
    @State private var starThickness: CGFloat = 0.0
    var starPoints: Int = 0
    var body: some View {
        ZStack {
            //Background image
            Image("stars")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                CreateStar(starPoints: 4, starThickness: $starThickness, animateStar: $animateYellow, fillColor: .yellow, starSizeStart: 0.2, starSizeEnd: 0.3, shadowColor: .yellow)
                    .offset(y: 100)
                    .onAppear() {
                        withAnimation(Animation.easeOut(duration: 2.3).repeatForever(autoreverses: true)) {
                            animateYellow.toggle()
                            starThickness = 0.35
                        }
                        
                    }
                
                CreateStar(starPoints: 4, starThickness: $starThickness, animateStar: $animateBlue, fillColor: .blue, starSizeStart: 0.1, starSizeEnd: 0.3, shadowColor: .blue)
                    .offset(x: 70, y: -60)
                    .onAppear() {
                        withAnimation(Animation.easeOut(duration: 3.3).repeatForever(autoreverses: true)) {
                            animateBlue.toggle()
                            starThickness = 0.35
                        }
                    }
                
                CreateStar(starPoints: 5, starThickness: $starThickness, animateStar: $animateRed, fillColor: .red, starSizeStart: 0.1, starSizeEnd: 0.3, shadowColor: .red)
                    .offset(x: -70, y: -150)
                    .onAppear() {
                        withAnimation(Animation.easeOut(duration: 2.3).repeatForever(autoreverses: true)) {
                            animateRed.toggle()
                            starThickness = 0.35
                        }
                    }
                
                CreateStar(starPoints: 6, starThickness: $starThickness, animateStar: $animatePurple, fillColor: .purple, starSizeStart: 0.2, starSizeEnd: 0.3, shadowColor: .purple)
                    .offset(x: 80, y: -120)
                    .onAppear() {
                        withAnimation(Animation.easeOut(duration: 4.3).repeatForever(autoreverses: true)) {
                            animatePurple.toggle()
                            starThickness = 0.35
                        }
                    }
                
                CreateStar(starPoints: 8, starThickness: $starThickness, animateStar: $animateGreen, fillColor: .green, starSizeStart: 0.1, starSizeEnd: 0.2, shadowColor: .green)
                    .offset(x: -80, y: -170)
                    .onAppear() {
                        withAnimation(Animation.easeOut(duration: 2.8).repeatForever(autoreverses: true)) {
                            animateGreen.toggle()
                            starThickness = 0.35
                        }
                    }
            }
        }
    }
}

#Preview {
    StarsView()
}
