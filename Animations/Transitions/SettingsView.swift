//
//  SettingsView.swift
//  Animations
//
//  Created by Tatiana on 20/05/25.
//

import SwiftUI

struct SettingsView: View {
    @State private var selection = 1
    @State private var setDate = Date()
    @State private var timeZoneOverride = true
    @State private var volume: Double = 25.0
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    Section(header: Text("Date and time")) {
                        DatePicker(selection: $setDate) {
                            Image(systemName: "calendar.circle")
                        }
                    }.foregroundStyle(Color.black)
                    
                    Section(header: Text("Time zone override")) {
                        Toggle(isOn: $timeZoneOverride) {
                            HStack {
                                Image(systemName: "timer")
                                Text("Override")
                            }
                        }
                    }.foregroundStyle(.black)
                    
                    Section(header: Text("Alarm volume")) {
                        Text("Volume \(String(format: "%0.f", volume as Double)) Decibels")
                        
                        Slider(value: $volume, in: 0...1000) { _ in
                            //action when slider moves
                        }
                    }.foregroundStyle(.black)
                    
                    Section(header: Text("")) {
                        Picker(selection: $selection, label: Text("Repeat Alarm:")) {
                            Text("No Repeat").tag(1)
                            Text("Repeat Once").tag(2)
                            Text("Repeat Twice").tag(3)
                        }
                    }
                    
                    Button {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            self.show = false
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text("Save")
                            Spacer()
                        }
                    }.listRowBackground(Color.green)
                }.foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    SettingsView(show: .constant(true))
}
