//
//  RoleCheckStartViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import Foundation

@MainActor

class RoleCheckStartViewModel: ObservableObject {
    
    @Published var playerNames: [String] = [] // プレイヤー名の空っぽな配列。
    @Published var currentIndex = 0 //  誰の番か？誰のターンか？何番目か？の状態。
    @Published var isGoRoleCheck = false // 役職確認画面へ遷移するためのフラグ。
    @Published var assignedRoles: [Role] = [] // シャッフルして割り当てられた役職一覧。
    @Published var swappedPlayerIndex: Int? = nil // 泥棒猫が役職を入れ替えた時の役職をしまっておくところ。
    @Published var isGoRobCatText = false // 泥棒猫専用の画面遷移のフラグ。
    @Published var swappedPlayerOriginalRole: Role? = nil // 泥棒猫が入れ替えた役職を記録しておくところ。
    @Published var selectedViewedIndex: Int? = nil // ボス猫が誰の役職を見たか？その番号。
    @Published var originalSwappedRole: Role? = nil // 泥棒猫が入れ替える前の役職が何か表示するためのところ。
    @Published var originalSwappedIndex: Int? = nil // 泥棒猫が入れ替える前の役職が何番のインデックスかを記録しておく。
    @Published var bossCatIndex: Int? = nil // ボス猫が何番のプレイヤーなのかを記録しておくところ。
    @Published var originalRoles: [Role]? = nil // 泥棒猫が役職を入れ替える前の役職一覧。
    @Published var isAllFinished = false // 画面遷移のフラグ。全員の役職確認が終わったら用。
    
    // RoleCheckStartViewの、この人に端末を渡してください。のこの人を出すやつ。
    var currentPlayerName: String {
        playerNames.indices.contains(currentIndex) ? playerNames[currentIndex] : ""
    }
    
    // displayedRoleで使うためのcurrentRoleを定義。
    var currentRole: Role? {
        assignedRoles.indices.contains(currentIndex) ? assignedRoles[currentIndex] : nil
    }
    
    // 泥棒猫が役職を入れ替えたことを考慮した状態で、表示すべき役職を表示してくれるやつ。
    var displayedRole: Role? {
        if currentIndex == swappedPlayerIndex {
            return originalSwappedRole
        } else {
            return currentRole
        }
    }
    
    // プレイヤー名を記録、インデックス配布、役職確認リセットの関数。GameReadyViewで使われるが、役職配布がされていないためここで定義。
    func startGame(with names: [String]) {
        playerNames = names
        currentIndex = 0
        isGoRoleCheck = false
        
        // 役職を定義してシャッフル。ボス猫のインデックスもここで記録。
        var roles: [Role] = [.human, .human, .robcat, .bosscat]
        let numberOfPlayers = names.count
        let numberOfNoraCats = max(1, numberOfPlayers - 4) 
        roles += Array(repeating: .noracat, count: numberOfNoraCats)
        assignedRoles = roles.shuffled()
        bossCatIndex = assignedRoles.firstIndex(of: .bosscat)
    }
    
    // 画面遷移のための関数。続くなら続くけど、終わりなら終わりで次の画面にいくよという感じ。
    func goToNextPlayer() {
        if currentIndex < playerNames.count - 1 {
            currentIndex += 1
            isGoRoleCheck = false
        } else {
            isGoRoleCheck = true
            isAllFinished = true
        }
    }

    // もう一人の人間は誰かの関数。泥棒猫に役職を入れ替えられていたとしても、元の役職を表示するように。
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
    
    // 泥棒猫が役職を入れ替える関数。元々の役職を保存して入れ替え、次の画面遷移へのフラグも。
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
    
    // 役職表示の関数。普通に役職を表示するけど、泥棒猫に入れ替えられた人は入れ替わる前を表示するように。
    func displayedRole(at index: Int) -> Role {
        if let original = originalRoles {
            return original[index]
        } else {
            return assignedRoles[index]
        }
    }
}
