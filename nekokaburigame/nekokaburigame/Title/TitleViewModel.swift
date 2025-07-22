//
//  TitleViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import Foundation

@MainActor

class TitleViewModel: ObservableObject {

    @Published var isGameStarted = false

    func startGame() {
        isGameStarted = true
    }
}
