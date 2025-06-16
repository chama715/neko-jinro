//
//  VoteStartViewModell.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/16.
//

import Foundation

@MainActor

class VoteStartViewViewModel: ObservableObject {
    @Published var playerNames: [String] = []
    @Published var currentIndex: Int = 0
    @Published var isVotingStarted = false

    func startVoting(with names: [String]) {
        playerNames = names
        currentIndex = 0
        isVotingStarted = true
    }
}
