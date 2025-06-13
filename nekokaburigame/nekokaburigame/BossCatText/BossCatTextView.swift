//
//  BossCatTextView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

import SwiftUI

struct BossCatTextView: View {
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 30) {
               // 泥棒猫に役職を盗まれていたら、とりあえずボス猫って表示させる。
                if viewModel.currentIndex == viewModel.swappedPlayerIndex,
                   let original = viewModel.originalSwappedRole {
                    Text("あなたの役職は「\(original.displayName)」です。")
                        .font(.title2)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                // ボス猫が誰かの役職を見ていたら、その役職がなにかを表示。
                else if let seen = viewModel.selectedViewedIndex,
                        seen >= 0 && seen < viewModel.playerNames.count && seen < viewModel.assignedRoles.count,
                        viewModel.currentIndex == viewModel.bossCatIndex {
                    let roleToShow: Role = {
                        // 選んだ相手が盗まれていた人だったら、盗み前の役職を表示。
                        if let swappedIndex = viewModel.swappedPlayerIndex,
                           swappedIndex == seen,
                           let original = viewModel.swappedPlayerOriginalRole {
                            return original //
                        } else {
                            return viewModel.assignedRoles[seen] 
                        }
                    }()
                    Text("\(viewModel.playerNames[seen])の役職は「\(roleToShow.displayName)」でした。")
                        .font(.title2)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                // ほぼないけど、else。
                else {
                    Text("表示できる情報がありません。")
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
