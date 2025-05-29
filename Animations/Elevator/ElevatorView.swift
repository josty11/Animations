//
//  ElevatorView.swift
//  Animations
//
//  Created by Tatiana on 29/05/25.
//

import SwiftUI

struct ElevatorView: View {
    @ObservedObject var appData: DataModel
    let backgroundColor = Color.black
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            //Elevator and people
            ElevatorAndPeopleView(doorsOpened: $appData.doorsOpened)
            
            //Button
            GeometryReader { geometry in
                Button {
                    appData.stopTimers()
                    appData.playDoorOpenCloseSound(interval: 0.5)
                    appData.doorsOpened.toggle()
                    appData.goingUp.toggle()
                    appData.floorNumbers()
                } label: {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundStyle(appData.doorsOpened ? .white : .black)
                        .overlay(Circle().stroke(Color.red, lineWidth: 1))
                        .padding(5)
                        .background(Color.black)
                        .cornerRadius(30)
                }
                .position(x: geometry.size.width / 33, y: geometry.size.height / 2)
                
                //Floor lights
                HStack {
                    Image(systemName: "1.circle")
                        .foregroundStyle(appData.floor1 ? .red : .black)
                        .opacity(appData.floor1 ? 1 : 0.3)
                    
                    Image(systemName: "2.circle")
                        .foregroundStyle(appData.floor2 ? .red : .black)
                        .opacity(appData.floor2 ? 1 : 0.3)
                }.position(x: geometry.size.width / 2, y: (geometry.size.height * 0.02) + 2)
            }
        }
    }
}

#Preview {
    ElevatorView(appData: DataModel())
}
