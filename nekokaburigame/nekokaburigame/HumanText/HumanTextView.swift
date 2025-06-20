//
//  HumanTextView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

import SwiftUI

struct HumanTextView: View {
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 30) {
                // 表示すべき役職（入れ替え前を含む）
                let displayed = viewModel.displayedRole(at: viewModel.currentIndex)

                // 入れ替え前の役職を表示
                Text("あなたの役職は「\(displayed.displayName)」です。")
                    .font(.title2)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()

                // もう1人の人間の名前を表示（originalRolesを参照するようにするのが望ましい）
                if !viewModel.otherHumanName().isEmpty {
                    Text("もう1人の人間は \(viewModel.otherHumanName()) です。")
                        .font(.title3)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                }

                Text("あなたともう1人の人間が\nどちらも投票されなかった場合\n人間チームの勝利となります。")
                    .font(.title3)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()

                // ボタンを押すと、次のプレイヤーに進む
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
