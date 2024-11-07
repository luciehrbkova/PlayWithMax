//
//  AudioPlayer.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 25/07/2024.
//

import Foundation
import AVFoundation

class AudioPlayer: ObservableObject {
    var player: AVAudioPlayer?

    func playSound(mp3: String) {
        do {
            // 1. Set up the audio session category
            try AVAudioSession.sharedInstance().setCategory(.playback)
            // 2. Activate the audio session
            try AVAudioSession.sharedInstance().setActive(true)
        } catch(let error) {
            print(error.localizedDescription)
        }
        guard let url = Bundle.main.url(forResource: mp3, withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error loading sound file: \(error)")
        }
    }
}
