//
//  RobCatTextView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

import SwiftUI

struct RobCatTextView: View {
    // RoleCheckStartViewModelを外部から受け取る、引き継ぎ。
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 30) {
                //
                if let swappedIndex = viewModel.swappedPlayerIndex,
                   swappedIndex < viewModel.playerNames.count,
                   let originalRole = viewModel.swappedPlayerOriginalRole {
                    
                    // 役職を入れ替えた相手をviewModelから取得してきて表示。
                    Text("役職を入れ替えた相手は\n\(viewModel.playerNames[swappedIndex]) です。")
                        .font(.title2)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    // 上記と同様の感じ。
                    Text("\(viewModel.playerNames[swappedIndex]) の役職は \(originalRole.displayName) でした。")
                        .font(.title3)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    Text("役職情報を取得できませんでした。")
                        .foregroundColor(.gray)
                        .padding()
                }

                // 画面遷移。
                Button(action: {
                    viewModel.goToNextPlayer()
                }) {
                    Text("次のプレイヤーへ")
                        .font(.title2)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
            .padding()
        }
    }
}
