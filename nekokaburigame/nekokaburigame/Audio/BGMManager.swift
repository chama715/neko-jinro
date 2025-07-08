//
//  BGMManager.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/07/02.
//

import AVFoundation

class BGMManager {
    static let shared = BGMManager()
    private var audioPlayer: AVAudioPlayer?

    func playBGM(named fileName: String, withExtension fileExtension: String = "mp3", volume: Float = 0.5) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("BGMファイルが見つかりません: \(fileName).\(fileExtension)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.volume = volume
            audioPlayer?.numberOfLoops = -1 
            audioPlayer?.play()
        } catch {
            print("BGM再生エラー: \(error)")
        }
    }
    
    
    func stopBGM() {
            audioPlayer?.stop()
        }
    
}

