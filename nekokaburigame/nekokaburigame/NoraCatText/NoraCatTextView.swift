//
//  NoraCatTextView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

import SwiftUI

struct NoraCatTextView: View {
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 30) {
                // 自分が泥棒猫に役職を奪われたのかのチェック。(知らされはしない)。一致しているか？
                if viewModel.currentIndex == viewModel.swappedPlayerIndex,
                   let original = viewModel.originalSwappedRole {
                    // 入れ替えられてたらこっち
                    Text("あなたの役職は「\(original.displayName)」です。")
                        .font(.title2)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    // 入れ替えられてなければこっち
                    Text("あなたの役職は「野良猫」です。")
                        .font(.title2)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                }

                Text("野良猫には特別なアクションはありません。\n話し合いで人間を見つけ出しましょう！")
                    .font(.title3)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()

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
