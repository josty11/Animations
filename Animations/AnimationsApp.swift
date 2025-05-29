//
//  AnimationsApp.swift
//  Animations
//
//  Created by Tatiana on 12.05.2025.
//

import SwiftUI

@main
struct AnimationsApp: App {
    @StateObject private var appData = DataModel()
    var body: some Scene {
        WindowGroup {
            ElevatorView(appData: appData)
        }
    }
}
