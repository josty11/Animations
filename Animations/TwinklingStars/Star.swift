//
//  Star.swift
//  Animations
//
//  Created by Tatiana on 02/06/25.
//

import SwiftUI

struct Star: Shape {
    let starPoints: Int
    var starThickness: CGFloat
    
    var animatableData: CGFloat {
        get { starThickness }
        set { starThickness = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        guard starPoints >= 3 else { return Path() }
        let drawPoint = CGPoint(x: rect.width / -1.2,
                                y: rect.height / 0.5)
        
        var starAngle = -CGFloat.pi / 2
        
        let adjustedStarAngle = .pi * 2 / CGFloat(starPoints * 2)
        
        let pointX = drawPoint.x * starThickness
        let pointY = drawPoint.y * starThickness
        var path = Path()
        path.move(to: CGPoint(x: drawPoint.x * cos(starAngle),
                              y: drawPoint.y * sin(starAngle)))
        
        var bottomEdge: CGFloat = 0
        for corner in 0..<starPoints * 2 {
            let sinAngle = sin(starAngle)
            let cosAngle = cos(starAngle)
            let bottom: CGFloat
            
            if corner.isMultiple(of: 2) {
                bottom = drawPoint.y * sinAngle
                path.addLine(to: CGPoint(x: drawPoint.x * cosAngle, y: bottom))
            } else {
                bottom = pointY * sinAngle
                path.addLine(to: CGPoint(x: pointX * cosAngle, y: bottom))
            }
            if bottom > bottomEdge {
                bottomEdge = bottom
            }
            
            starAngle += adjustedStarAngle
        }
        let bottomSpace = (rect.height / 2 - bottomEdge) / 2
        
        let transform = CGAffineTransform(translationX: drawPoint.x, y: drawPoint.y + bottomSpace)
        return path.applying(transform)
    }
}

struct CreateStar: View {
    var starPoints: Int
    @Binding var starThickness: CGFloat
    @Binding var animateStar: Bool
    
    var fillColor: Color
    var starSizeStart: CGFloat
    var starSizeEnd: CGFloat
    var shadowColor: Color
    
    var body: some View {
        VStack {
            Star(starPoints: starPoints, starThickness: starThickness)
                .fill(fillColor)
                .frame(width: 60, height: 60)
                .scaleEffect(animateStar ? starSizeStart : starSizeEnd)
                .shadow(color: shadowColor, radius: 20, x: 3, y: 3)
        }
    }
}
