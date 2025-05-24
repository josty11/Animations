//
//  FlowerView.swift
//  Animations
//
//  Created by Tatiana on 14/05/25.
//

import SwiftUI

struct FlowerView: View {
    @State private var petal = false
    @State private var breatheInLabel = true
    @State private var breatheOutLabel = false
    @State private var offsetBreath = false
    @State private var diffuseBreath = false
    @State private var breathTheBouquet = false
    
    var body: some View {
        ZStack {
//            Rectangle()
//                .fill(LinearGradient(gradient: Gradient(colors: [.black, .blue]), startPoint: .center, endPoint: .bottom))
//                .edgesIgnoringSafeArea(.all)
            Image("winterNight")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .scaleEffect(1.4)
            SnowView()
            ZStack {
                //MARK: - Animate text labels
                Group {
                    Text("Breathe in")
                        .font(.system(size: 35))
                        .foregroundStyle(Color.white)
                        .opacity(breatheInLabel ? 0 : 1)
                        .scaleEffect(breatheInLabel ? 0 : 1)
                        .offset(y: -160)
                        .animation(
                            Animation.easeInOut(duration: 2)
                                .delay(2)
                                .repeatForever(autoreverses: true),
                            value: breatheInLabel
                        )
                    
                    Text("Breathe out")
                        .font(.system(size: 35))
                        .foregroundStyle(Color.blue)
                        .opacity(breatheOutLabel ? 0 : 1)
                        .scaleEffect(breatheOutLabel ? 0 : 1)
                        .offset(y: -160)
                        .animation(
                            Animation.easeInOut(duration: 2)
                                .delay(2)
                                .repeatForever(autoreverses: true),
                            value: breatheInLabel
                        )
                }
                
                //MARK: - Convert a still image intro animated smoke
                Group {
                    Image("smoke")
                        .resizable()
                        .frame(width: 35, height: 125)
                        .offset(y: offsetBreath ? 90 : 0)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: offsetBreath)
                        .blur(radius: diffuseBreath ? 1 : 60)
                        .offset(x: 0, y: diffuseBreath ? -50 : -100)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: diffuseBreath)
                }.shadow(radius: diffuseBreath ? 20 : 0)
                
                //MARK: - Animate the petals
                Group {
                    //One left of the middle
                    PetalView(petal: $petal, degrees: petal ? -25 : -5)
                    
                    //middle
                    Image("petal").resizable().frame(width: 75, height: 125)
                    
                    //one right of the middle
                    PetalView(petal: $petal, degrees: petal ? 25 : 5)
                    
                    //two left from the middle
                    PetalView(petal: $petal, degrees: petal ? -50 : -10)

                    //two right from the middle
                    PetalView(petal: $petal, degrees: petal ? 50 : 10)

                }
                
                //MARK: - The bouquet
                Group {
                    Image("bouquet")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 400)
                        .rotationEffect(.degrees(37))
                        .offset(x: -25, y: 90)
                        .scaleEffect(breathTheBouquet ? 1.04 : 1, anchor: .center)
                        .animation(
                            Animation.easeInOut(duration: 2)
                                .delay(2)
                                .repeatForever(autoreverses: true),
                            value: breathTheBouquet
                        )
                    
                    Image("bouquet")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 400)
                        .rotationEffect(.degrees(37))
                        .offset(x: -20, y: 95)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        .scaleEffect(breathTheBouquet ? 1.04 : 1, anchor: .center)
                        .animation(
                            Animation.easeInOut(duration: 2)
                                .delay(2)
                                .repeatForever(autoreverses: true),
                            value: breathTheBouquet
                        )
                }
            }
        }
        .onAppear {
            breatheInLabel.toggle()
            breatheOutLabel.toggle()
            offsetBreath.toggle()
            diffuseBreath.toggle()
            petal.toggle()
            breathTheBouquet.toggle()
        }
    }
}

#Preview {
    FlowerView()
}
