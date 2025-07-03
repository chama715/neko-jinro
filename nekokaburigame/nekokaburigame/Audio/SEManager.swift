//
//  SEManager.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/07/02.
//

import AVFoundation

class SEManager {
    static let shared = SEManager()
    private var audioPlayer: AVAudioPlayer?

    func playSE(named fileName: String, withExtension fileExtension: String = "mp3", volume: Float = 1.0) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("SEファイルが見つかりません: \(fileName).\(fileExtension)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.volume = volume
            audioPlayer?.play()
        } catch {
            print("SE再生エラー: \(error)")
        }
    }
}

