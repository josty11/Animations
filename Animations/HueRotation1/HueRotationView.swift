//
//  HueRotationView.swift
//  Animations
//
//  Created by Tatiana on 14/05/25.
//

import SwiftUI

struct HueRotationView: View {
    @State private var shiftColors = false
    @State private var image = "dog"
    
    let backgroundColor: Color = .black
    var body: some View {
        VStack {
            ZStack {
                backgroundColor.edgesIgnoringSafeArea(.all)
                
                Image(image)
                    .resizable()
                    .padding(20)
                    .frame(width: 250, height: 250)
                    .hueRotation(.degrees(shiftColors ? 360 * 2 : 0))
                    .animation(Animation.easeInOut(duration: 2).delay(0.4).repeatForever(autoreverses: true))
                    .onAppear {
                        shiftColors.toggle()
                    }
            }
            
            ImagePicker(selectedImage: $image)
                .frame(width: 350, height: 200)
        }.background(.black)
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct ImagePicker: View {
    @Binding var selectedImage: String
    let images = ["ornament", "landscape", "dog", "dice", "cat"]
    
    var body: some View {
        Picker("", selection: $selectedImage) {
            ForEach(images, id: \.self) { value in
                Text(value)
                    .foregroundStyle(Color.white)
            }
        }
        .pickerStyle(.wheel)
        .frame(width: 300, height: 150)
        .background(Color.red.colorMultiply(.blue))
        .cornerRadius(20)
        .shadow(color: .white, radius: 5, x: 0, y: 0)
    }
}
#Preview {
    HueRotationView()
}
