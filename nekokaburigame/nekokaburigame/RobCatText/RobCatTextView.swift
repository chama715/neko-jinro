//
//  RobCatTextView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

import SwiftUI

struct RobCatTextView: View {
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 30) {
                // 役職をうまく入れ替えられていれば
                if let swappedIndex = viewModel.swappedPlayerIndex,
                   swappedIndex < viewModel.playerNames.count,
                   let originalRole = viewModel.swappedPlayerOriginalRole {
                    
                    // 入れ替えたプレイヤーを表示。
                    Text("役職を入れ替えた相手は\n\(viewModel.playerNames[swappedIndex]) です。")
                        .font(.title2)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    // 入れ替えたプレイヤーの役職を表示。
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
