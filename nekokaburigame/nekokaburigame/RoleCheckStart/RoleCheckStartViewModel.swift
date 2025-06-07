//
//  RoleCheckStartViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import Foundation

@MainActor
class RoleCheckStartViewModel: ObservableObject {
    @Published var playerNames: [String] = []
    @Published var currentIndex: Int = 0
    @Published var isGoRoleCheck: Bool = false
    @Published var assignedRoles: [Role] = []

    var currentPlayerName: String {
        playerNames.indices.contains(currentIndex) ? playerNames[currentIndex] : ""
    }
    
    var currentRole: Role? {
        assignedRoles.indices.contains(currentIndex) ? assignedRoles[currentIndex] : nil
    }

    func startGame(with names: [String]) {
        playerNames = names
        currentIndex = 0
        isGoRoleCheck = false

        let roles: [Role] = [.human, .human, .noracat, .robcat, .bosscat]
        assignedRoles = roles.shuffled()
    }


    func goToNextPlayer() {
        if currentIndex < playerNames.count - 1 {
            currentIndex += 1
            isGoRoleCheck = false
        } else {
            isGoRoleCheck = true
        }
    }
    
    func otherHumanName() -> String {
        guard assignedRoles.indices.contains(currentIndex),
              assignedRoles[currentIndex] == .human else {
            return ""
        }
        for (index, role) in assignedRoles.enumerated() {
            if role == .human && index != currentIndex {
                return playerNames[index]
            }
        }
        return ""
    }
}
