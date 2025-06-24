//
//  NoraCatTextView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

import SwiftUI

struct NoraCatTextView: View {
    // ViewModelを引き継ぎ。
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 30) {
                //　viewModelから、今表示中の役職の情報を取得。
                let role = viewModel.displayedRole(at: viewModel.currentIndex)

                // からの表示。野良猫だね。
                Text("あなたの役職は「\(role.displayName)」です。")
                    .font(.title2)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()

                Text("野良猫には特別なアクションはありません。\n話し合いで人間を見つけ出しましょう！")
                    .font(.title3)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()

                // 画面遷移。次のプレイヤーへ。
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
