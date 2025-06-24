//
//  HumanTextView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

import SwiftUI

struct HumanTextView: View {
    // 同様に、ViewModelを引き継いで使わせてもらっている。
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 30) {
                // 今のプレイヤーが見るべき役職(人間)を取得している。
                let displayed = viewModel.displayedRole(at: viewModel.currentIndex)

                // 人間を表示。
                Text("あなたの役職は「\(displayed.displayName)」です。")
                    .font(.title2)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()

                // 人間は、もう1人の人間が誰なのかを確認することができる。
                if !viewModel.otherHumanName().isEmpty {
                    Text("もう1人の人間は \(viewModel.otherHumanName()) です。")
                        .font(.title3)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                }

                // 軽い説明。
                Text("あなたともう1人の人間が\nどちらも投票されなかった場合\n人間チームの勝利となります。")
                    .font(.title3)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()

                // 次のプレイヤーの役職確認画面へ。
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
