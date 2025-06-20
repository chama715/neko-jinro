//
//  RoleCheckEndView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/15.
//

import SwiftUI

struct RoleCheckEndView: View {
    let playerNames: [String]
    let viewModel: RoleCheckStartViewModel
    @Binding var path: NavigationPath
    // この画面専用のViewModel
    @StateObject private var endViewModel = RoleCheckEndViewModel()
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Text("夜が明けました。\nこれから全員で話し合いを行います。")
                    .font(.title3)
                    .padding()
                
                Text("制限時間内に話し合いを行い\n処刑するプレイヤーを1人選んでください。")
                    .font(.title3)
                    .padding()
                
                Text("猫チームの誰かが処刑された場合\n人間チームの勝利となり\n人間チームの誰かが処刑された場合は\n猫チームの勝利となります。")
                    .font(.title3)
                    .padding()
                
                Button(action: {
                    endViewModel.startGame()
                }) {
                    Text("話し合いを開始する")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
        }
        .navigationDestination(isPresented: $endViewModel.isGameStarted) {
            DiscussionView(
                playerNames: playerNames,
                assignedRoles: viewModel.assignedRoles,
                path: $path
            )
        }

    }
}
