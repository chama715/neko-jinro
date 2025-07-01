//
//  VoteSelectViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/16.
//

/*
 今誰なのかを保持しておく状態を定義と、投票をした時に呼ばれる関数を定義。
 */

import Foundation

@MainActor
class VoteSelectViewModel: ObservableObject {
    @Published var selectedPlayer: String? = nil

    func vote(for name: String?) {
        guard let name = name else { return }
        print("投票先: \(name)")
    }
}
