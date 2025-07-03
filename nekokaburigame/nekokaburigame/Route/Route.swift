//
//  Route.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/19.
//

/*
 型で管理して、安全にどの画面に行くか決める道しるべにしてるファイル
 */

import Foundation

enum Route: Hashable {
    case title
    case last(playerNames: [String], assignedRoles: [Role], originalRoles: [Role], executedPlayerName: String)
    case rule
    case announcement(playerNames: [String], assignedRoles: [Role], originalRoles: [Role], executedPlayerName: String)
}

