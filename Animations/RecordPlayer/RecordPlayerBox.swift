//
//  RecordPlayerBox.swift
//  Animations
//
//  Created by Tatiana on 14/05/25.
//

import SwiftUI

struct RecordPlayerBox: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 345, height: 345)
                .cornerRadius(10)
                .foregroundStyle(Color.black)
            Image("woodGrain")
                .resizable()
                .frame(width: 325, height: 325)
                .shadow(color: .white, radius: 3, x: 0, y: 0)
        }
    }
}

#Preview {
    RecordPlayerBox()
}
