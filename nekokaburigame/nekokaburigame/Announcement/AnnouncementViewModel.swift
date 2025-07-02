//
//  AnnouncementViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/18.
//

/*
 役職一覧の変数のみ。
 */

import Foundation

@MainActor
class AnnouncementViewModel: ObservableObject {
    var assignedRoles: [Role] = []
}
