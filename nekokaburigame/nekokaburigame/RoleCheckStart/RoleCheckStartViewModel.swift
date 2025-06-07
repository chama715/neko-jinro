//
//  RoleCheckStartViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import Foundation

@MainActor
class RoleCheckStartViewModel: ObservableObject {
    @Published var playerNames: [String] = []
    @Published var currentIndex: Int = 0
    @Published var isGoRoleCheck: Bool = false

    var currentPlayerName: String {
        playerNames.indices.contains(currentIndex) ? playerNames[currentIndex] : ""
    }

    func startGame(with names: [String]) {
        playerNames = names
        currentIndex = 0
        isGoRoleCheck = false
    }

    func goToNextPlayer() {
        if currentIndex < playerNames.count - 1 {
            currentIndex += 1
        } else {
            isGoRoleCheck = true // 最後のプレイヤーまで終わったら役職画面へ
        }
    }
}
