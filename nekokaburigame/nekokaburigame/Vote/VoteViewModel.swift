//
//  VoteViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/15.
//

/*
 画面遷移のフラグ、役職の配列を定義。
 */

import Foundation

@MainActor
class VoteViewModel: ObservableObject {
    @Published var goToExecution = false
    @Published var goToVote = false
    @Published var assignedRoles: [Role] = []
}
