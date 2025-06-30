//
//  RoleCheckEndViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/15.
//

/*
 画面遷移のためのフラグと関数のみ。
 */

import Foundation

@MainActor

class RoleCheckEndViewModel: ObservableObject {

    @Published var isGameStarted = false
    
    func startGame() {
        isGameStarted = true
    }
}

