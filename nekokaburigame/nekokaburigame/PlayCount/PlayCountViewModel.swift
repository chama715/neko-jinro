//
//  PlayCountViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import Foundation

@MainActor
// PlayCountViewModelというクラスを定義。ObservableObjectに準拠しているので、Publishedとかの変化をViewに通知できる。
class PlayCountViewModel: ObservableObject {

    // プレイヤー数の変数。デフォは5人。
    @Published var playerCount: Int = 5
    // 画面遷移をするためのフラグ。のちの関数でこれの値がtrueになる。
    @Published var isGameReadyActive = false
    
    // プレイヤー名の配列。人数に合わせて空の文字列が出る。
    var playerName: [String] = Array(repeating: "", count: 5)

    // 配列を調整する関数。
    func adjustPlayerNameArray() {
        // プレイヤーの数が、配列より多い場合・・・
        if playerCount > playerName.count {
            // いくつ足りないのかを計算して・・・
            let diff = playerCount - playerName.count
            // 末尾に空の文字列を追加する。
            playerName.append(contentsOf: Array(repeating: "", count: diff))
            // 逆パターン(プレイヤー数が減ったら・・・)
        } else {
            // プレイヤー数分の配列に揃える。
            playerName = Array(playerName.prefix(playerCount))
        }
    }

    // 画面遷移の関数。
    func startGame() {
        isGameReadyActive = true
    }
}


