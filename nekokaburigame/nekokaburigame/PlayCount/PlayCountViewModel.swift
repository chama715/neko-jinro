//
//  PlayCountViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//
import Foundation

@MainActor
class PlayCountViewModel: ObservableObject {
    @Published var playerCount: Int = 5
    @Published var isGameReadyActive = false
    @Published var playerName: [String]

    init() {
        self.playerName = Array(repeating: "", count: 5)
    }

    func adjustPlayerNameArray() {
        if playerCount > playerName.count {
            let diff = playerCount - playerName.count
            playerName.append(contentsOf: Array(repeating: "", count: diff))
        } else {
            playerName = Array(playerName.prefix(playerCount))
        }
    }

    func startGame() {
        isGameReadyActive = true
    }
}
