//
//  VoteCheckViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/18.
//

import Foundation

@MainActor
class VoteCheckViewModel: ObservableObject {
    var votes: [String]

    init(votes: [String]) {
        self.votes = votes
    }

    func mostVotedPlayer() -> String {
        let voteCounts = Dictionary(grouping: votes, by: { $0 })
            .mapValues { $0.count }

        return voteCounts.max(by: { $0.value < $1.value })?.key ?? "該当なし"
    }
    
    func mostVotedPlayers() -> [String] {
        let voteCounts = Dictionary(grouping: votes, by: { $0 })
            .mapValues { $0.count }

        let maxVotes = voteCounts.values.max() ?? 0
        return voteCounts.filter { $0.value == maxVotes }.map { $0.key }
    }

}

