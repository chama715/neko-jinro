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
    @Published var currentIndex = 0
    @Published var isGoRoleCheck = false
    @Published var assignedRoles: [Role] = []
    @Published var swappedPlayerIndex: Int? = nil
    @Published var isGoRobCatText = false
    @Published var swappedPlayerOriginalRole: Role? = nil
    @Published var selectedViewedIndex: Int? = nil
    @Published var originalSwappedRole: Role? = nil
    @Published var originalSwappedIndex: Int? = nil
    @Published var bossCatIndex: Int? = nil
    @Published var originalRoles: [Role]? = nil


    
    @Published var isAllFinished = false

    var currentPlayerName: String {
        playerNames.indices.contains(currentIndex) ? playerNames[currentIndex] : ""
    }
    
    var currentRole: Role? {
        assignedRoles.indices.contains(currentIndex) ? assignedRoles[currentIndex] : nil
    }
    
    var displayedRole: Role? {
        if currentIndex == swappedPlayerIndex {
            return originalSwappedRole
        } else {
            return currentRole
        }
    }
    
    func startGame(with names: [String]) {
        playerNames = names
        currentIndex = 0
        isGoRoleCheck = false

        let roles: [Role] = [.human, .human, .noracat, .robcat, .bosscat]
        assignedRoles = roles.shuffled()
        bossCatIndex = assignedRoles.firstIndex(of: .bosscat)
    }
    
    func goToNextPlayer() {
        if currentIndex < playerNames.count - 1 {
            currentIndex += 1
            isGoRoleCheck = false
        } else {
            isGoRoleCheck = true
            isAllFinished = true
        }
    }

    
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
