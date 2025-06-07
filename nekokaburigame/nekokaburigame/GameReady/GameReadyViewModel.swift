//
//  GameReadyViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import Foundation

@MainActor
class GameReadyViewModel: ObservableObject {
    @Published var isGameReady = false
    @Published var rolechekStartviewModel = RoleCheckStartViewModel()
    
    func startGame() {
        rolechekStartviewModel.startGame(with: ["A","B","C","D","E"])
        isGameReady = true
    }
}
