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
                let displayed = viewModel.displayedRole(at: viewModel.currentIndex)

                Text("あなたの役職は「\(displayed.displayName)」です。")
                    .font(.title2)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()

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
