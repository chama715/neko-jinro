//
//  Model.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

/*
 役職専用ファイル！列挙型。
 */

import Foundation

enum Role: String, CaseIterable {
    case human = "人間"
    case noracat = "野良猫"
    case robcat = "泥棒猫"
    case bosscat = "ボス猫"
    
    var displayName: String {
        switch self {
        case .human: return "人間"
        case .noracat: return "野良猫"
        case .robcat: return "泥棒猫"
        case .bosscat: return "ボス猫"
        }
    }
}
