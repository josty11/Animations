//
//  HeartView.swift
//  Animations
//
//  Created by Tatiana on 10/06/25.
//

import SwiftUI

struct HeartView: View {
    @State var strokeReset = true
    @State var startStroke: CGFloat = 0
    @State var endStroke: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.black
            Image("heart")
                .resizable()
                .frame(width: 190, height: 180)
                .offset(x: -5, y: -150)
            Group {
                //Shape outline
                HeartShape()
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .foregroundStyle(.gray)
                
                //Animating stroke
                HeartShape()
                    .trim(from: startStroke, to: endStroke)
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .foregroundStyle(.white)
            }.offset(x: 100, y: 150)
        }.onAppear() {
            Timer.scheduledTimer(withTimeInterval: 0.23, repeats: true) { timer in
                //Use this value to set a delay before the animation starts again, a larger number increases the delay
                if endStroke >= 1 {
                    if strokeReset {
                        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { _ in
                            endStroke = 0
                            startStroke = 0
                            strokeReset.toggle()
                        }
                        strokeReset = false
                    }
                }
                withAnimation(Animation.easeOut) {
                    endStroke += 0.12
                    startStroke = endStroke - 1.4
                    
                }
            }
        }
    }
}

#Preview {
    HeartView()
}
