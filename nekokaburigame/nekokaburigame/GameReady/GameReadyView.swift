//
//  GameReady.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

// 役職振り分け前の画面。
// 状態管理、ボタンアクション、画面遷移はTitle、PlayCountファイルの応用でいけた。

import SwiftUI

struct GameReadyView: View {
    let playerNames: [String]
    @StateObject private var viewModel = GameReadyViewModel()
    @Binding var path: NavigationPath
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("夜がきました。\n各自役職を確認し\n夜のアクションを行ってください。")
                    .font(.title3)
                    .bold()
                    .padding()
                
                // viewModelのstarGammeにplayerNamesを渡す。
                Button(action: {
                    viewModel.startGame(with: playerNames)
                }) {
                    Text("OK")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
            // 画面遷移。isGameReadyがtrueになったら、RoleCheckStartViewModelを渡す。
            .navigationDestination(isPresented: $viewModel.isGameReady) {
                RoleCheckStartView(
                    path: $path,
                    viewModel: viewModel.rolechekStartviewModel
                )
            }

            
            .navigationDestination(isPresented: $viewModel.goToVotePhase) {
                VoteView(
                    playerNames: playerNames,
                    assignedRoles: Array(viewModel.assignedRoles),
                    path: $path
                )
            }
        }
    }
}
