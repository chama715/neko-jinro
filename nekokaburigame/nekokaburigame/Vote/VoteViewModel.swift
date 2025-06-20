//
//  VoteViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/15.
//

import Foundation

@MainActor
class VoteViewModel: ObservableObject {
    @Published var goToExecution = false
    @Published var goToVote = false
    @Published var assignedRoles: [Role] = []
}
