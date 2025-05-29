//
//  DataModel.swift
//  Animations
//
//  Created by Tatiana on 29/05/25.
//

import SwiftUI

class DataModel: ObservableObject {
    @Published var doorsOpened = false
    @Published var floor1 = false
    @Published var floor2 = false
    @Published var goingUp = false
    @Published var doorOpenTimer: Timer? = nil
    @Published var chimesTimer: Timer? = nil
    @Published var doorSoundTimer: Timer? = nil
    
    func openDoors() {
        doorOpenTimer = Timer.scheduledTimer(withTimeInterval: 8, repeats: false, block: { _ in
            self.doorsOpened.toggle()
        })
    }
    
    func playChimeSound() {
        chimesTimer = Timer.scheduledTimer(withTimeInterval: 5.5, repeats: false, block: { _ in
            playSound(sound: "elevatorChime", type: "m4a")
        })
    }
    
    func playDoorOpenCloseSound(interval: TimeInterval) {
        doorSoundTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false, block: { _ in
            playSound(sound: "doorsOpenClose", type: "m4a")
        })
    }
    
    func floorNumbers() {
        //Light up Floor 1 as soon as the button is pressed, making sure floor 2 is not lit first
        if !floor2 {
            floor1.toggle()
        }
        
        //Check if the doors are opened, if not, open the doors and play the chime sound
        if !doorsOpened {
            openDoors()
            playChimeSound()
            
            //If going up, wait 4 seconds, turn on the floor 2 light and turn off the floor 1 light
            if goingUp {
                withAnimation(Animation.default.delay(4.0)) {
                    floor2 = true
                    floor1 = false
                }
                
                //Once at the top and the button is pressed again to go down, wait 5 seconds, then turn off the floor 2 light and turn on the floor 1 light
                withAnimation(Animation.default.delay(5.0)) {
                    floor1 = true
                    floor2 = false
                    playDoorOpenCloseSound(interval: 8.5)
                }
                
            //If not going up keep the floor 2 light on for 5 seconds until the elevator doors close, then turn it off and turn on the floor 1 lights, play the chimes and door sounds
            } else {
                withAnimation(Animation.default.delay(5.0)) {
                    floor1 = true
                    floor2 = false
                    playDoorOpenCloseSound(interval: 8.5)
                }
                
                withAnimation(Animation.default.delay(5.0)) {
                    floor2 = true
                    floor1 = false
                }
            }
        }
    }
    
    func stopTimers() {
        chimesTimer = nil
        chimesTimer?.invalidate()

        doorSoundTimer = nil
        doorSoundTimer?.invalidate()

        doorOpenTimer = nil
        doorOpenTimer?.invalidate()
    }
}
