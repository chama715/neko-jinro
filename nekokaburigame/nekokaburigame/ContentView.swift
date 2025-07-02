//
//  ContentView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

/*
 TitleViewが1番最初にくるように。そしてNavigationStackをここで定義しておくことで、他のファイルで画面遷移に使える。
 
 */

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
                        
                        let viewModel = LastPageViewModel(
                            playerNames: playerNames,
                            assignedRoles: assignedRoles,
                            originalRoles: originalRoles,
                            executedPlayerName: executedPlayerName
                        )
                        LastPageView(viewModel: viewModel, path: $path)
                    }
                }
        }
    }
}

