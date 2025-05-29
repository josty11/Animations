//
//  PlaySound.swift
//  Animations
//
//  Created by Tatiana on 14/05/25.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let url = Bundle.main.url(forResource: sound, withExtension: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("error playing sound: \(error.localizedDescription)")
        }
    }
}
