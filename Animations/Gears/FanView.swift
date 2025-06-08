//
//  FanView.swift
//  Animations
//
//  Created by Tatiana on 08/06/25.
//

import SwiftUI

struct FanView: View {
    @State var rotateFan = false
    var degrees: Double = 360 * 4
    
    var body: some View {
        ZStack {
            Image("fan")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .rotationEffect(.degrees(rotateFan ? degrees : 0), anchor: .center)
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false), value: rotateFan)
                .onAppear() {
                    rotateFan.toggle()
                }
                .shadow(color: .black, radius: 15)
        }
    }
}

#Preview {
    FanView()
}
