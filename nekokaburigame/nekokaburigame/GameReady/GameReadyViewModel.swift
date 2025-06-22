//
//  GameReadyViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import Foundation

@MainActor
// Publishedとか使うならObservableObject！って感じなのかな？
class GameReadyViewModel: ObservableObject {

    // RoleCheckStartViewに進むかどうかのフラグ。
    @Published var isGameReady = false
    // RoleCheckStartViewのViewModelをインスタンス化。
    @Published var rolechekStartviewModel = RoleCheckStartViewModel()
    // VoteViewに進むかどうかのフラグ。
    @Published var goToVotePhase = false

    // 各プレイヤーの役職を外から見られるようにしたプロパティ。
    var assignedRoles: [Role] {
            rolechekStartviewModel.assignedRoles
        }
    
    // 画面遷移の関数。プレイヤー名を次の画面のViewModelに渡し、役職割り当て。
    func startGame(with names: [String]) {
            rolechekStartviewModel.startGame(with: names)
            isGameReady = true
    }
}
