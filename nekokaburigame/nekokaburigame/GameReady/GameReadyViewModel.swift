//
//  GameReadyViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import Foundation

@MainActor
class GameReadyViewModel: ObservableObject {
    // 画面遷移用の状態管理。
    @Published var isGameReady = false
    @Published var rolechekStartviewModel = RoleCheckStartViewModel()
    @Published var goToVotePhase = false

    var assignedRoles: [Role] {
            rolechekStartviewModel.assignedRoles
        }

    
    func startGame(with names: [String]) {
            rolechekStartviewModel.startGame(with: names)
            isGameReady = true
    }
}
