//
//  VoteView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/15.
//

import SwiftUI

struct VoteView: View {
    let playerNames: [String]
    let assignedRoles: [Role]
    @StateObject private var viewModel = VoteViewModel()
    @Binding var path: NavigationPath

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("話し合いが終了しました。\n各自、処刑するプレイヤーを選択し\n次のプレイヤーに端末を渡してください。")
                    .font(.title3)
                    .bold()
                    .padding()
                
                Button(action: {
                    viewModel.goToVote = true
                    // 投票画面へ遷移
                }) {
                    Text("投票画面へ")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                Text("処刑するプレイヤーが話し合いで\n決まっている場合は、こちらから\n選択することも可能です。")
                    .font(.title3)
                    .bold()
                    .padding()
                
                Button(action: {
                    viewModel.goToExecution = true
                }) {
                    Text("プレイヤー選択画面へ")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
            .navigationDestination(isPresented: $viewModel.goToVote) {
                VoteStartView(
                    playerNames: playerNames,
                    assignedRoles: assignedRoles,
                    path: $path
                )
            }
            
            .navigationDestination(isPresented: $viewModel.goToExecution) {
                ExecutionView()
            }
        }
    }
}
