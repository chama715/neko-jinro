//
//  DiscussionViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/15.
//

import Foundation

@MainActor
class DiscussionViewModel: ObservableObject { // 変更の内容がViewに伝わる。
    @Published var selectedMinutes = 3 // タイマーの分。デフォは3分なので3に。
    @Published var selectedSeconds = 0 // タイマーの秒。デフォは0秒なので0。
    @Published var remainingTime = 0 //  合計の秒数(残り)の空箱。表示されるのはこれ。
    @Published var isTimerRunning = false // ボタンの中身というか、これがtrueになったら表示が変わる。

    //
    var timer: Timer?

    // 表示用の文字を作るための式。timeStringを二桁に揃えて、値を変換。
    var timeString: String {
        String(format: "%02d:%02d", remainingTime / 60, remainingTime % 60)
    }

    // タイマースタートの関数。タイマーをスタートしたい時はこいつを呼び出し実行！
    func startTimer() {
        // 残りの秒数
        remainingTime = selectedMinutes * 60 + selectedSeconds
        // タイマースタートの合図。
        isTimerRunning = true

        // タイマーが動いていたら止める。
        timer?.invalidate()
        //
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            //
            DispatchQueue.main.async {
                // まだ残り秒が残っていたら、1秒ずつ減らしていく。
                if self.remainingTime > 0 {
                    self.remainingTime -= 1
                    // 残り時間0なら、止める。
                } else {
                    self.stopTimer()
                }
            }
        }
    }

    // タイマーを止める関数。
    func stopTimer() {
        isTimerRunning = false
        timer?.invalidate()
        timer = nil
    }
}
