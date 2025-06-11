//
//  LightSwitchView.swift
//  Animations
//
//  Created by Tatiana on 11/06/25.
//

import SwiftUI

struct LightSwitchView: View {
    let appWidth = UIScreen.main.bounds.width
    let appHeight = UIScreen.main.bounds.height
    let animationDuration: TimeInterval = 0.35
    @State var xScale: CGFloat = 2
    @State var yScale: CGFloat = 0.4
    @State var yOffset: CGFloat = UIScreen.main.bounds.height * 0.8
    @State var isOff = true
    
    var body: some View {
        ZStack {
            Color.black
            
            //Light
            Circle().fill(Color.yellow)
                .scaleEffect(CGSize(width: xScale, height: yScale))
                .offset(y: yOffset)
            
            //Arrow and label
            VStack(alignment: .leading) {
                HStack {
                Image(systemName: "arrow.left").foregroundStyle(isOff ? .white : .black)
                    .font(.system(size: 24, weight: .semibold, design: .monospaced))
                
                Spacer()
                
                Text("Study Room")
                    .font(.system(size: 32, weight: .bold, design: .monospaced))
                    .foregroundStyle(isOff ? .white : .black)
                    .offset(x: -12)
                    Spacer()
                }.padding([.top, .bottom], 24)
                Spacer()
            }
            .offset(y: 32)
            .padding([.leading, .trailing], 24)
            
            Capsule(style: .continuous)
                .foregroundStyle(.gray)
                .frame(width: 52, height: appHeight * 0.25 + 6)
                .opacity(0.275)
                .offset(x: appWidth / 2 - 48, y: 16)
            
            //Grey capsule for the end of the rope
            ZStack {
                Capsule()
                    .frame(width: 3, height: isOff ? appHeight * 0.41 : appHeight * 0.625)
                    .foregroundStyle(.white)
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 42)
                    .offset(y: isOff ? appHeight * 0.225 : appHeight * 0.25 + 42)
                    .onTapGesture {
                        toggleAllLights()
                    }
            }
            .offset(x: appWidth / 2 - 48, y: -appHeight / 2)
            .frame(height: 0, alignment: .top)
        }
        .animation(.spring(dampingFraction: 0.65).speed(1.25))
        .edgesIgnoringSafeArea(.all)
    }
    
    func toggleAllLights() {
        if isOff {
            withAnimation(Animation.easeIn(duration: animationDuration)) {
                xScale = 4
                yScale = 4
                yOffset = 0
            }
        } else {
            withAnimation(Animation.easeOut(duration: animationDuration * 0.75)) {
                xScale = 2
                yScale = 0.4
                yOffset = UIScreen.main.bounds.height * 0.8
            }
        }
        isOff.toggle()
    }
}

#Preview {
    LightSwitchView()
}
