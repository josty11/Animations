//
//  HueView.swift
//  Animations
//
//  Created by Tatiana on 15/05/25.
//

import SwiftUI

struct HueView: View {
    @State private var hueRotation = false
    var backgrounds: [String] = ["img1", "img2", "img3", "img4", "img5", "img6", "img7", "img8", "img9", "img10", "img11", "img12", "img13"]
    var body: some View {
        GeometryReader { geo in
            BackgroundScroll(imageCount: backgrounds.count) {
                ForEach(0 ..< backgrounds.count, id: \.self) { number in
                    Image(backgrounds[number])
                        .resizable()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                }
            }
            .hueRotation(.degrees(hueRotation ? 10 : 500))
            .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true), value: hueRotation)
            .onAppear {
                hueRotation.toggle()
            }
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct BackgroundScroll<ViewContent: View>: View {
    private var imageCount: Int
    private var contentContainer: ViewContent
    @State private var workingIndex: Int = 0
    private let timer = Timer.publish(every: 5, on: .main, in: .default).autoconnect()
    init(imageCount: Int, @ViewBuilder content: () -> ViewContent) {
        self.imageCount = imageCount
        self.contentContainer = content()
    }
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                HStack(spacing: 0) {
                    contentContainer
                }
                .frame(width: geo.size.width,
                       height: geo.size.height,
                       alignment: .leading)
                .offset(x: CGFloat(self.workingIndex) * -geo.size.width, y: 0)
                .animation(.easeInOut)
                .onReceive(timer) { _ in
                    workingIndex = (workingIndex + 1) % (imageCount == 0 ? 1 : imageCount)
                }
                
                HStack {
                    ForEach(0 ..< imageCount, id: \.self) { index in
                        Circle()
                            .frame(width: index == workingIndex ? 13 : 9, height: index == workingIndex ? 13 : 9)
                            .foregroundStyle(index == workingIndex ? .white : .gray)
                            .overlay(Circle().stroke(Color.black, lineWidth: 1))
                            .padding(.bottom, 20)
                            .animation(.easeInOut)
                    }
                }
            }
        }
    }
}

#Preview {
    HueView()
}
