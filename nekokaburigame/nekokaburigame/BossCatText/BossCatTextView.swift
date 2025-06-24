//
//  BossCatTextView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

import SwiftUI

struct BossCatTextView: View {
    // RoleCheckStartViewModelを引き継ぎ。
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 30) {

                //
                if let seen = viewModel.selectedViewedIndex,
                   seen >= 0 && seen < viewModel.playerNames.count,
                   viewModel.currentIndex == viewModel.bossCatIndex {

                    //
                    let roleToShow = viewModel.displayedRole(at: seen)

                    //
                    Text("\(viewModel.playerNames[seen])の役職は「\(roleToShow.displayName)」でした。")
                        .font(.title2)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                }

                //
                else if viewModel.currentIndex == viewModel.swappedPlayerIndex,
                        let original = viewModel.originalSwappedRole {
                    Text("あなたの役職は「\(original.displayName)」です。")
                        .font(.title2)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                }

                //
                else {
                    Text("表示できる情報がありません。")
                        .foregroundColor(.gray)
                        .padding()
                }

                 // 画面遷移
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
