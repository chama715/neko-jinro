//
//  RoleCheckStartViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

// このゲームの心臓部分。
// プレイヤーの名前や役職を管理する。
// めちゃめちゃ複雑だが、titleとplaycountの知識、関数、配列などがわかっていればなんとかいける。

import Foundation

@MainActor

// ObservableObjectで、メイン画面のObservedObjectに監視されている。
class RoleCheckStartViewModel: ObservableObject {
    // ゲームの進行に必要な状態変数たち。1つず必要なもんを追加してったらこんなになっちゃったけどこれでいいのか。
    @Published var playerNames: [String] = [] // プレイヤー名のリスト。String型の配列。空箱。
    @Published var currentIndex = 0 // 今見ているプレイヤーの順番。0から順に増えていく。
    @Published var isGoRoleCheck = false // isGoRoleCkeckがtrueになったら、画面遷移するやつ。デフォがfalse。
    @Published var assignedRoles: [Role] = [] // プレイヤーごとに割り振られた役職の一覧。
    @Published var swappedPlayerIndex: Int? = nil // 泥棒猫が入れ替えた役職のインデックス番号。オプショナル型。
    @Published var isGoRobCatText = false // 役職を入れ替えた後の画面遷移のスイッチ。
    @Published var swappedPlayerOriginalRole: Role? = nil // 泥棒猫が役職を入れ替えた時、入れ替えた役職がなんなのか。
    @Published var selectedViewedIndex: Int? = nil // 泥棒猫が役職を入れた時、入れ替えられた被害者のやつに表示する役職。
    @Published var originalSwappedRole: Role? = nil // 上記と同じ。
    @Published var originalSwappedIndex: Int? = nil // ボス猫が誰の役職を見たか。
    @Published var bossCatIndex: Int? = nil // ボス猫が誰か。
    @Published var originalRoles: [Role]? = nil


    
    @Published var isAllFinished = false // 役職確認終了後、話し合いの画面に遷移するためのやつ

    
    // 今現在のプレイヤー名を返す処理。ここで表示された人に端末を渡す。
    var currentPlayerName: String {
        playerNames.indices.contains(currentIndex) ? playerNames[currentIndex] : ""
    }
    
    // 今現在のプレイヤーに振り分けられた役職。
    var currentRole: Role? {
        assignedRoles.indices.contains(currentIndex) ? assignedRoles[currentIndex] : nil
    }
    
    // どの役職を表示するか。泥棒猫に盗まれたやつは、盗まれる前の役職を表示する。
    // こいつは役職を入れ替えられちゃった？はいorいいえで別の処理。はいなら、元々の役職。いいえなら、現在の役職。
    var displayedRole: Role? {
        if currentIndex == swappedPlayerIndex {
            return originalSwappedRole
        } else {
            return currentRole
        }
    }
    
    // プレイヤー名を設定し、初期化。する関数。
    func startGame(with names: [String]) {
        playerNames = names
        currentIndex = 0
        isGoRoleCheck = false
        // 役職の振り分け。ランダム。
        let roles: [Role] = [.human, .human, .noracat, .robcat, .bosscat]
        assignedRoles = roles.shuffled()
        bossCatIndex = assignedRoles.firstIndex(of: .bosscat)
    }
    
    // 次へ。の処理。全員が終わったら、その次の画面へ。
    func goToNextPlayer() {
        if currentIndex < playerNames.count - 1 {
            currentIndex += 1
            isGoRoleCheck = false
        } else {
            isGoRoleCheck = true // 最後のプレイヤーの確認画面へ
            isAllFinished = true // そのあと話し合い画面へ
        }
    }

    
    // 人間が、もう1人の人間は誰かを表示させるための関数。
    func otherHumanName() -> String {
        let rolesToUse = originalRoles ?? assignedRoles

        guard rolesToUse.indices.contains(currentIndex),
              rolesToUse[currentIndex] == .human else {
            return ""
        }

        for (index, role) in rolesToUse.enumerated() {
            if role == .human && index != currentIndex {
                return playerNames[index]
            }
        }

        return ""
    }
    
    // 泥棒猫が役職を入れ替える処理。誰と入れ替えたのかを保存しておく。
    func swapRole(with index: Int) {
        let thiefIndex = currentIndex

        if originalRoles == nil {
            originalRoles = assignedRoles
        }

        swappedPlayerOriginalRole = assignedRoles[index]
        swappedPlayerIndex = index
        originalSwappedRole = assignedRoles[index]

        assignedRoles.swapAt(thiefIndex, index)
        isGoRobCatText = true
    }

    
    func displayedRole(at index: Int) -> Role {
        if let original = originalRoles {
            return original[index]
        } else {
            return assignedRoles[index]
        }
    }

    
}
