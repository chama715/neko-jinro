//
//  PlayCountViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import Foundation

@MainActor
class PlayCountViewModel: ObservableObject {
    // プレイヤー数の状態変数。推奨人数は5人！変更できる。
    @Published var playerCount: Int = 5
    // プレイヤー名の配列
    var playerName: [String] = Array(repeating: "", count: 5)
    // isGameReadyActiveの状態が変わったら画面に通知がいく。falseにしておいて、trueになったら画面が変わる。
    @Published var isGameReadyActive: Bool = false
    
    // プレイヤー数を変更する関数。
    func adjustPlayerNameArray() {
        // もし、プレイヤー数が増えたら・・・
        if playerCount > playerName.count {
            // まずは箱がいくつ足りないのか。
            let diff = playerCount - playerName.count
            // 足りない分だけ、ケツにリストを追加。
            playerName.append(contentsOf: Array(repeating: "", count: diff))
            // 減った場合は・・・
        } else {
            // 必要な分だけ残す。
            playerName = Array(playerName.prefix(playerCount))
        }
    }
    // isGameReadyActiveの値をtrueにする関数
    func startGame() {
        isGameReadyActive = true
    }
}


