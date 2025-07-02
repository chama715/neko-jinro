//
//  LastPageViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/19.
//

/*
 プレイヤー名の配列、振り分け役職の配列、入れ替え後の役職の配列、処刑されたプレイヤーの定数を定義。
 初期化時に必要なデータを受け取り、プロパティに保存。
 あとは勝敗のロジック。人間が処刑されてれば猫チームの勝ち、逆もしかり。
 で、各プレイヤーの名前、役職、勝敗を表示するためのやつ。
 
 */

import Foundation

@MainActor

class LastPageViewModel: ObservableObject {
    let playerNames: [String]
    let assignedRoles: [Role]
    let originalRoles: [Role]
    let executedPlayerName: String

    init(playerNames: [String], assignedRoles: [Role], originalRoles: [Role], executedPlayerName: String) {
        self.playerNames = playerNames
        self.assignedRoles = assignedRoles
        self.originalRoles = originalRoles
        self.executedPlayerName = executedPlayerName
    }

    var winnerText: String {
        guard let index = playerNames.firstIndex(of: executedPlayerName),
              index < assignedRoles.count else {
            return "勝敗判定エラー（役職不明）"
        }

        let role = assignedRoles[index]
        
        switch role {
        case .robcat, .bosscat, .noracat:
            return "人間チームの勝利！"
        case .human:
            return "猫チームの勝利！"
        }
    }

    var playerResults: [(name: String, role: Role, result: String)] {
        guard let executedIndex = playerNames.firstIndex(of: executedPlayerName),
              executedIndex < assignedRoles.count else {
            return playerNames.enumerated().map { (i, name) in
                let role = (i < originalRoles.count) ? originalRoles[i] : .human
                return (name, role, "不明")
            }
        }

        let executedRole = assignedRoles[executedIndex] 
        let humanWin = (executedRole == .robcat || executedRole == .bosscat || executedRole == .noracat)

        return playerNames.indices.map { i in
            let displayRole = (i < originalRoles.count) ? originalRoles[i] : .human
            let judgeRole   = (i < assignedRoles.count) ? assignedRoles[i] : .human
            let isHumanTeam = (judgeRole == .human)
            let didWin = (humanWin && isHumanTeam) || (!humanWin && !isHumanTeam)
            return (playerNames[i], displayRole, didWin ? "勝ち！" : "負け")
        }
    }
}
