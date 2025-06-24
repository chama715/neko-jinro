//
//  RoleCheckStartViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

// どの状態はどのViewで使っているものなのかを明記したい。

import Foundation

@MainActor
// ObservableObjectに準拠しているので、Publishedとかの変化をViewに通知できる。
class RoleCheckStartViewModel: ObservableObject {

    // プレイヤー名の配列
    @Published var playerNames: [String] = []
    // 今は誰？の番号
    @Published var currentIndex = 0
    // 画面遷移のフラグ
    @Published var isGoRoleCheck = false
    // 割り振られる役職の配列
    @Published var assignedRoles: [Role] = []
    // 泥棒猫が入れ替えた相手の番号
    @Published var swappedPlayerIndex: Int? = nil
    // 泥棒猫用の画面遷移のフラグ
    @Published var isGoRobCatText = false
    // 泥棒猫が役職を入れ替える前の相手の役職を保存。
    @Published var swappedPlayerOriginalRole: Role? = nil
    // ボス猫が誰の役職を見たか？
    @Published var selectedViewedIndex: Int? = nil
    // 泥棒猫が役職を入れ替える前の相手の役職を表示するやつ
    @Published var originalSwappedRole: Role? = nil
    // 元々なんの役職だったのか。
    @Published var originalSwappedIndex: Int? = nil
    // ボス猫が何番のインデックスなのか
    @Published var bossCatIndex: Int? = nil
    // 役職を入れ替える前のみんなの役職を保存。
    @Published var originalRoles: [Role]? = nil
    // 役職確認が終わり、次の画面遷移にいくためのフラグ。
    @Published var isAllFinished = false

    // プレイヤー名を取得するプロパティ。
    var currentPlayerName: String {
        playerNames.indices.contains(currentIndex) ? playerNames[currentIndex] : ""
    }
    
    // 表示されているプレイヤーに役職を割り当てる。
    var currentRole: Role? {
        assignedRoles.indices.contains(currentIndex) ? assignedRoles[currentIndex] : nil
    }
    
    // 役職表示。泥棒猫に入れ替えられている場合は、元々の役職を表示。
    var displayedRole: Role? {
        if currentIndex == swappedPlayerIndex {
            return originalSwappedRole
        } else {
            return currentRole
        }
    }
    
    // プレイヤー名を保存。インデックスをデフォに戻す。役職の配列をランダムに割り当て。ボス猫のインデックスを記録しておく。
    func startGame(with names: [String]) {
        playerNames = names
        currentIndex = 0
        isGoRoleCheck = false

        let roles: [Role] = [.human, .human, .noracat, .robcat, .bosscat]
        assignedRoles = roles.shuffled()
        bossCatIndex = assignedRoles.firstIndex(of: .bosscat)
    }
    
    // 次のプレイヤーへ進めるための関数。ラストまでいったら、次の画面へ。
    func goToNextPlayer() {
        if currentIndex < playerNames.count - 1 {
            currentIndex += 1
            isGoRoleCheck = false
        } else {
            isGoRoleCheck = true
            isAllFinished = true
        }
    }

    // もし仮に自分が人間だった場合、もう1人は誰なのかを教えてくれる関数。
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
    
    // 泥棒猫が役職を入れ替える時の関数。元の役職はしっかり保存しつつ、入れ替える。
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

    // 元々なんの役職だったのかを知りたい時に使う関数。
    func displayedRole(at index: Int) -> Role {
        if let original = originalRoles {
            return original[index]
        } else {
            return assignedRoles[index]
        }
    }
}
