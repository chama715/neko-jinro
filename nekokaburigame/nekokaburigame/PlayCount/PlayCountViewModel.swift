//
//  PlayCountViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

/*
 PlayCountViewModelというObservableObjectに準拠したクラスを定義。
 プレイヤー数の状態、画面遷移用のフラグ、プレイヤー数分の配列を用意。
 adjustPlayerNameArray()は、プレイヤー数に応じて配列の数を調整してくれる関数。プレイヤー数がプレイヤーの配列よりも多ければ、いくつ足りないかを計算して追加してくれる。
 */

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

