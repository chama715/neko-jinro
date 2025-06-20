//
//  LastPageViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/19.
//

import Foundation

@MainActor
class LastPageViewModel: ObservableObject {
    let playerNames: [String]
    let assignedRoles: [Role]
    let executedPlayerName: String

    init(playerNames: [String], assignedRoles: [Role], executedPlayerName: String) {
        self.playerNames = playerNames
        self.assignedRoles = assignedRoles
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
                let role = (i < assignedRoles.count) ? assignedRoles[i] : .human
                return (name, role, "不明")
            }
        }

        let executedRole = assignedRoles[executedIndex]
        let humanWin = (executedRole == .robcat || executedRole == .bosscat || executedRole == .noracat)

        return zip(playerNames, assignedRoles).map { name, role in
            let isHumanTeam = (role == .human)
            let didWin = (humanWin && isHumanTeam) || (!humanWin && !isHumanTeam)
            return (name, role, didWin ? "勝ち！" : "負け")
        }
    }
}
