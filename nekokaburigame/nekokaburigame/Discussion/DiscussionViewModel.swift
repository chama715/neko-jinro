//
//  DiscussionViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/15.
//

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
        //
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            //
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
