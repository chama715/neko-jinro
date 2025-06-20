//
//  Route.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/19.
//

import Foundation

enum Route: Hashable {
    case title
    case last(playerNames: [String], assignedRoles: [Role], executedPlayerName: String)
}
