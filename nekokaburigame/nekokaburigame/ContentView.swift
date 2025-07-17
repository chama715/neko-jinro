//
//  ContentView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            TitleView(path: $path)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .title:
                        TitleView(path: $path)
                        
                    case .last(let playerNames, let assignedRoles, let originalRoles, let executedPlayerName):
                        do {
                            let viewModel = LastPageViewModel(
                                playerNames: playerNames,
                                assignedRoles: assignedRoles,
                                originalRoles: originalRoles,
                                executedPlayerName: executedPlayerName
                            )
                            LastPageView(viewModel: viewModel, path: $path)
                        }
                        
                    case .rule:
                        RuleView(path: $path)
                        
                    case .announcement(let playerNames, let assignedRoles, let originalRoles, let executedPlayerName):
                        let viewModel = AnnouncementViewModel()
                        AnnouncementView(
                            executedPlayerName: executedPlayerName,
                            playerNames: playerNames,
                            assignedRoles: assignedRoles,
                            originalRoles: originalRoles,
                            viewModel: viewModel,
                            path: $path
                        )
                    }
                }
        }
    }
}

