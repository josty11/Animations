//
//  PickerView.swift
//  Animations
//
//  Created by Tatiana on 04/06/25.
//

import SwiftUI

struct PickerView: View {
    @Binding var pickerSelection: Int
    var body: some View {
        Picker(selection: self.$pickerSelection) {
            Text("Temperature").tag(0)
            Text("Precipitation").tag(1)
            Text("Wind").tag(2)
        } label: {
            Text("")
        }
        .pickerStyle(SegmentedPickerStyle())
        .background(RoundedRectangle(cornerRadius: 8)
            .stroke(Color.black, lineWidth: 2)
            .shadow(color: Color.black, radius: 8, x: 0, y: 0))
        .cornerRadius(8)
        .padding(.horizontal, 15)
        .padding(.bottom, 15)

    }
}

#Preview {
    PickerView(pickerSelection: .constant(0))
        .previewLayout(.fixed(width: 350, height: 100))
}
