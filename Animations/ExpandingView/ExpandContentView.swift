//
//  ExpandContentView.swift
//  Animations
//
//  Created by Tatiana on 10/06/25.
//

import SwiftUI

struct ExpandContentView: View {
    @State var isAnimating = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ZStack {
                ExpandingView(expand: $isAnimating, direction: .bottom, symbolName: "note.text")
                ExpandingView(expand: $isAnimating, direction: .left, symbolName: "doc")
                ExpandingView(expand: $isAnimating, direction: .top, symbolName: "photo")
                ExpandingView(expand: $isAnimating, direction: .right, symbolName: "mic.fill")
                
                Image(systemName: "plus")
                    .font(.system(size: 40, weight: isAnimating ? .regular : .semibold, design: .rounded))
                    .foregroundStyle(isAnimating ? .white : .black)
                    .rotationEffect(isAnimating ? .degrees(45) : .degrees(0))
                    .scaleEffect(isAnimating ? 3 : 1)
                    .opacity(isAnimating ? 0.5 : 1)
                    .animation(.spring(response: 0.35, dampingFraction: 0.85, blendDuration: 1))
                    .onTapGesture {
                        isAnimating.toggle()
                    }
            }
        }
    }
}

#Preview {
    ExpandContentView()
}
