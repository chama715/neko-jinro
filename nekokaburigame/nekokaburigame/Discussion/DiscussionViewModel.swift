//
//  DiscussionViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/15.
//

import Foundation
import Combine

@MainActor
class DiscussionViewModel: ObservableObject {
    @Published var remainingTime: Int = 180 // 3分（180秒）
    @Published var isTimerActive = false

    private var timer: AnyCancellable?

    var timeString: String {
        String(format: "%02d:%02d", remainingTime / 60, remainingTime % 60)
    }

    func startTimer() {
        isTimerActive = true
        timer?.cancel()
        timer = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if self.remainingTime > 0 {
                    self.remainingTime -= 1
                } else {
                    self.stopTimer()
                }
            }
    }

    func stopTimer() {
        isTimerActive = false
        timer?.cancel()
    }

    func adjustTime(by seconds: Int) {
        let newTime = remainingTime + seconds
        if newTime >= 0 {
            remainingTime = newTime
        }
    }
}

