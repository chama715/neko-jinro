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
    
    func startGame() {
        isGameReady = true
    }
}
