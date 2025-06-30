//
//  DiscussionViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/15.
//

/*
 Viewで動いているタイマーのロジックの部分。
 分と秒の状態を作成し、デフォを3分0秒にする。
 残り時間の状態も作成。
 タイマーが動いているかそうでないのかの状態、画面遷移のためのフラグも設定。
 表示を見やすい2桁のやつに変更。
 タイマーをスタートさせる関数（0になっている残りの秒数を3分にセット→フラグをtrueに→動いちゃってたらそれは捨て→新しいTimerを繰り返しで→残り時間があるなら減らして、0まで！→終わったら次の画面へ）
 タイマーを止める関数、タイマーを止めて画面遷移するための関数。
 */

import Foundation

@MainActor

class DiscussionViewModel: ObservableObject {
    @Published var selectedMinutes = 3
    @Published var selectedSeconds = 0
    @Published var remainingTime = 0
    @Published var isTimerRunning = false
    @Published var isDiscussionFinished = false
    
    var timer: Timer?
    var timeString: String {
        String(format: "%02d:%02d", remainingTime / 60, remainingTime % 60)
    }
    
    func startTimer() {
        remainingTime = selectedMinutes * 60 + selectedSeconds
        isTimerRunning = true
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            DispatchQueue.main.async {
                if self.remainingTime > 0 {
                    self.remainingTime -= 1
                } else {
                    self.endDiscussion()
                }
            }
        }
    }
    
    func stopTimer() {
        isTimerRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    func endDiscussion() {
            stopTimer()
            isDiscussionFinished = true
        }
}
