//
//  PrlxView.swift
//  Animations
//
//  Created by Tatiana on 24/05/25.
//

import SwiftUI

struct ParallaxView: View {
    @State private var animate1 = false
    @State private var animate2 = false
    
    var body: some View {
        ZStack {
            //MARK: - Background
            LinearGradient(gradient: Gradient(colors: [.blue, .gray]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            
            //MARK: - Title
            VStack {
                Text("Parallax effect")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 80)
                
                //MARK: - Wolf image
                VStack {
                    Image("wolf")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(25)
                        .shadow(color: .black, radius: 30, x: 5, y: 5)
                }
                .rotation3DEffect(.degrees(animate1 ? 13 : -13),
                                   axis: (x: animate1 ? 90 : -45,
                                          y: animate1 ? -45 : -90,
                                          z: 0))
                .animation(Animation.easeInOut(duration: 3.5).repeatForever(autoreverses: true))
                .onAppear() {
                    animate1.toggle()
                }.padding(30)
                
                //MARK: - Cube image
                VStack {
                    Image("cube")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(25)
                        .shadow(color: .black, radius: 30, x: 5, y: 5)
                }
                .rotation3DEffect(.degrees(animate2 ? 13 : -13),
                                   axis: (x: animate2 ? 90 : -45,
                                          y: animate2 ? -45 : -90,
                                          z: 0))
                .animation(Animation.easeInOut(duration: 4.0).repeatForever(autoreverses: true))
                .onAppear() {
                    animate2.toggle()
                }.padding(30)
            }
        }
    }
}

#Preview {
    ParallaxView()
}
