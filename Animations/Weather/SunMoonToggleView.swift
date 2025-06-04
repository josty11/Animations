//
//  SunMoonToggleView.swift
//  Animations
//
//  Created by Tatiana on 04/06/25.
//

import SunMoonToggleStyle
import SwiftUI

struct SunMoonToggleView: View {
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            Toggle(isOn: $isOn, label: label)
                .toggleStyle(SunMoonToggleStyle())
                .padding(.horizontal, 134)
        }
    }
    
    func label() -> Text {
        isOn ? Text("Moon").bold() : Text("Sun").bold()
    }
}
