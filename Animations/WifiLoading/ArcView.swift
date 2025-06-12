//
//  ArcView.swift
//  Animations
//
//  Created by Tatiana on 11/06/25.
//

import SwiftUI

struct ArcView: View {
    var radius: CGFloat
    @Binding var fillColor: Color
    @Binding var shadowColor: Color
    
    var body: some View {
        ArcShape(radius: radius)
            .fill(fillColor)
            .shadow(color: shadowColor, radius: 5)
            .frame(height: radius)
            .animation(.spring().speed(0.75))
            .onTapGesture {
                fillColor = Color.wifiConnected
            }
    }
}

struct ArcShape: Shape {
    var radius: CGFloat
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: radius,
                    startAngle: .degrees(220),
                    endAngle: .degrees(320),
                    clockwise: false)
        return path.strokedPath(.init(lineWidth: 6, lineCap: .round))
    }
}

#Preview {
    ZStack {
        Color.black.edgesIgnoringSafeArea(.all)
        ArcView(radius: 42, fillColor: .constant(.green), shadowColor: .constant(.red))
    }
}
