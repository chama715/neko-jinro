//
//  VoteViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/15.
//

import Foundation

@MainActor
class VoteViewModel: ObservableObject {

    @Published var isGameReady = false
    @Published var rolechekStartviewModel = RoleCheckStartViewModel()
    
    func startGame(with names: [String]) {
            rolechekStartviewModel.startGame(with: names)
            isGameReady = true
    }
}
