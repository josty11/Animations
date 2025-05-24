//
//  OpenSettingsView.swift
//  Animations
//
//  Created by Tatiana on 24/05/25.
//

import SwiftUI

struct OpenSettingsView: View {
    @State private var isShowing = false
    let gradientBackground = Gradient(colors: [.red, .orange, .pink])
    
    let buttonBorderGradient = LinearGradient(gradient: Gradient(colors: [.red, .orange, .black]), startPoint: .bottomLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(gradient: gradientBackground, startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.vertical)
                
                VStack {
                    Text("Wake up").foregroundStyle(.black).font(.title).bold()
                    Image(systemName: "clock").font(.largeTitle).bold()
                }.offset(y: -25)
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.isShowing = true
                    }
                }) {
                    Image(systemName: "gear").font(Font.system(size: 20).weight(.bold))
                }.padding(10)
                    .background(.white)
                    .cornerRadius(30)
                    .foregroundStyle(.black)
                    .offset(y: 200)
                
                if isShowing {
                    SettingsView(show: $isShowing)
                        .transition(.fly)
                        .zIndex(1)
                }
            }
        }
    }
}

extension AnyTransition {
    static var fly: AnyTransition {
        get {
            AnyTransition.modifier(active: PresentAndDismiss(offsetValue: 0), identity: PresentAndDismiss(offsetValue: 1))
        }
    }
}

#Preview {
    OpenSettingsView()
}
