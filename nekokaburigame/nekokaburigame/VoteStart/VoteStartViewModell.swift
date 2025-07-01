//
//  VoteStartViewModell.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/16.
//

/*
 プレイヤー名、今何番目か、画面遷移のフラグ、役職の配列の状態を定義。
 投票開始時に呼び出される関数→(フラグをonにして、プレイヤー名をセットし、投票結果を空にする。)
 投票結果を記録する関数(ボタンを押した時に呼び出される)→誰に投票したのかを記録し、次の人へ。最後の人だったとき、フラグをonにして画面遷移をする。
 投票結果とかをリセットする関数→各プレイヤーに渡る前に発動。
 最多得票者を集計する関数。→誰が処刑されるか決まる。
 */

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
