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
    @Published var votes: [String] = []
    
    func startVoting(with names: [String]) {
        playerNames = names
        currentIndex = 0
        votes = []
        isVotingStarted = true
    }

    func recordVote(for votedName: String) {
        votes.append(votedName)
        if currentIndex + 1 < playerNames.count {
            currentIndex += 1
        } else {
            isVotingStarted = false
        }
    }

    func resetVoting() {
        currentIndex = 0
        votes = []
        isVotingStarted = false
    }
    
    func mostVotedPlayer() -> String {
        let voteCounts = Dictionary(grouping: votes, by: { $0 })
            .mapValues { $0.count }
        return voteCounts.max(by: { $0.value < $1.value })?.key ?? "該当なし"
    }

}
