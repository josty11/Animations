//
//  GearShaftView.swift
//  Animations
//
//  Created by Tatiana on 08/06/25.
//

import SwiftUI

struct GearShaftView: View {
    @State var animateRect = false
    
    var body: some View {
        ZStack {
            ZStack {
                Image("shaft")
                    .resizable()
                    .frame(width: 160, height: 40)
                
                Rectangle()
                    .frame(width: 140, height: 8)
                    .foregroundStyle(.black)
                    .cornerRadius(5)
                    .opacity(animateRect ? 0 : 0.5)
                    .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: animateRect)
                    .onAppear() {
                        animateRect.toggle()
                    }.offset(x: 0, y: -7)
            }
        }
    }
}

#Preview {
    GearShaftView()
}
