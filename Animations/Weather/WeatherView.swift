//
//  WeatherView.swift
//  Animations
//
//  Created by Tatiana on 04/06/25.
//

import SwiftUI
import SunMoonToggleStyle

struct WeatherView: View {
    
    @State var dataArray = [WeatherModel.temperature, WeatherModel.precipitation, WeatherModel.wind]
    var capsuleWidth: CGFloat = 14
    @State private var pickerSelection = 0
    @State private var isOn = false
    @State private var animateTemp = false
    @State private var animatePrecip = false
    @State private var animateWind = false
    @State private var animateTempImage = false
    @State private var animatePrecipImage = false
    @State private var animateWindImage = false
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .black
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    
    var body: some View {
        ZStack {
            Color(.sRGB, red: 255/255, green: 195/255, blue: 0/255)
                .edgesIgnoringSafeArea(.all)

            VStack {
                SunMoonToggleView(isOn: $isOn)
                
                //Title
                Text("Weather")
                    .font(.system(size: 40, weight: .medium))
                    .shadow(color: .black, radius: 1, x: 0, y: 0)
                
                PickerView(pickerSelection: $pickerSelection)
                    .onReceive([pickerSelection].publisher.first()) { value in
                        if value == 0 {
                            animateTemp = true
                            animatePrecip = false
                            animateWind = false
                            
                            animateTempImage = true
                            animatePrecipImage = false
                            animateWindImage = false
                        } else if value == 1 {
                            animatePrecip = true
                            animateTemp = false
                            animateWind = false
                            
                            animatePrecipImage = true
                            animateTempImage = false
                            animateWindImage = false
                        } else {
                            animateWind = true
                            animateTemp = false
                            animatePrecip = false
                            
                            animateWindImage = true
                            animateTempImage = false
                            animatePrecipImage = false
                        }
                    }
                
                //Graph
                ZStack {
                    HStack(spacing: 20) {
                        WeeklyGraph(dayHeightData: dataArray[pickerSelection][0], width: (350) / capsuleWidth)
                        WeeklyGraph(dayHeightData: dataArray[pickerSelection][1], width: (350) / capsuleWidth)
                        WeeklyGraph(dayHeightData: dataArray[pickerSelection][2], width: (350) / capsuleWidth)
                        WeeklyGraph(dayHeightData: dataArray[pickerSelection][3], width: (350) / capsuleWidth)
                        WeeklyGraph(dayHeightData: dataArray[pickerSelection][4], width: (350) / capsuleWidth)
                        WeeklyGraph(dayHeightData: dataArray[pickerSelection][5], width: (350) / capsuleWidth)
                        WeeklyGraph(dayHeightData: dataArray[pickerSelection][6], width: (350) / capsuleWidth)
                    }
                    .animation(.spring(response: 0.9, dampingFraction: 0.6))
                    
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 1)
                        .shadow(color: .black, radius: 8, x: 3, y: 3)
                        .padding(.horizontal, 10)
                }
                
                GeometryReader { geometry in
                    VStack {
                        if animateTemp {
                            Text("Temperature")
                                .fontWeight(.medium)
                                .font(.title)
                                .shadow(color: .black, radius: 1, x: 0, y: 2)
                                .transition(AnyTransition.offset(x: 300))
                                .animation(Animation.easeInOut(duration: 1.0))
                        }
                        
                        if animatePrecip {
                            Text("Precipitation")
                                .fontWeight(.medium)
                                .font(.title)
                                .shadow(color: .black, radius: 1, x: 0, y: 2)
                                .transition(AnyTransition.offset(x: -300))
                                .animation(Animation.easeInOut(duration: 1.0))
                        }
                        
                        if animateWind {
                            Text("Wind")
                                .fontWeight(.medium)
                                .font(.title)
                                .shadow(color: .black, radius: 1, x: 0, y: 2)
                                .transition(AnyTransition.offset(x: 300))
                                .animation(Animation.easeInOut(duration: 1.0))
                        }
                    }.position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.2)
                    
                    VStack {
                        if animateTempImage {
                            Image("tempImage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                                .position(y: geometry.size.height / 2)
                                .transition(AnyTransition.offset(y: 300))
                                .animation(Animation.easeInOut(duration: 1.0))
                        }
                        if animatePrecipImage {
                            Image("precip")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                                .position(y: geometry.size.height / 2)
                                .transition(AnyTransition.offset(x: 300))
                                .animation(Animation.easeInOut(duration: 1.0))
                        }
                        if animateWindImage {
                            Image("wind")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                                .position(y: geometry.size.height / 2)
                                .transition(AnyTransition.offset(x: -300))
                                .animation(Animation.easeInOut(duration: 1.0))
                        }
                    }.position(x: geometry.size.width, y: geometry.size.height * 0.6)
                }
                
            }
        }
    }
}

#Preview {
    WeatherView()
}
