//
//  VoteSelectViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/16.
//

import Foundation

@MainActor
class VoteSelectViewModel: ObservableObject {
    @Published var selectedPlayer: String? = nil

    func vote(for name: String?) {
        guard let name = name else { return }
        print("投票先: \(name)")
    }
}
