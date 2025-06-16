//
//  ExecutionViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/16.
//

import Foundation


@MainActor

class ExecutionViewModel: ObservableObject {
    @Published var isGameStarted = false
    func startGame() {
        isGameStarted = true
    }
}
