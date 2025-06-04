//
//  WeeklyGraph.swift
//  Animations
//
//  Created by Tatiana on 04/06/25.
//

import SwiftUI
struct WeeklyGraph: View {
    var dayHeightData: WeatherModel
    var width: CGFloat
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule()
                    .opacity(0.3)
                    .frame(width: width + 2, height: 200)
                    .background(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 2)
                        .shadow(color: .black, radius: 8, x: 0, y: 0))
                
                Capsule()
                    .frame(width: width, height: dayHeightData.data * 200)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .opacity(0.9))
            }
            .padding(.bottom, 8)
            Text(dayHeightData.day)
                .font(.system(size: 14))
        }
    }
}
