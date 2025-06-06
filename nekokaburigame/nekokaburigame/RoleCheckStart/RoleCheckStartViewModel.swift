//
//  RoleCheckStartViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import Foundation

@MainActor
class RoleCheckStartViewModel: ObservableObject {
    @Published var isGoRoleCheck = false

    func startGame() {
        isGoRoleCheck = true
    }
}
