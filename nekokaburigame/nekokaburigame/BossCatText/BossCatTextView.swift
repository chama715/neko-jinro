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
                // ① 入れ替えられたプレイヤーには元の役職を表示
                if viewModel.currentIndex == viewModel.swappedPlayerIndex,
                   let original = viewModel.originalSwappedRole {
                    Text("あなたの役職は「\(original.displayName)」です。")
                        .font(.title2)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                // ② ボス猫が誰かの役職を見た場合、その結果を表示
                else if let seen = viewModel.selectedViewedIndex,
                        seen >= 0 && seen < viewModel.playerNames.count && seen < viewModel.assignedRoles.count,
                        viewModel.currentIndex == viewModel.bossCatIndex {
                    let roleToShow: Role = {
                        // もしボス猫が見た相手が泥棒猫に役職を入れ替えられていたら
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
                // ③ それ以外（何も表示できない場合）
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


#Preview {
    let vm = RoleCheckStartViewModel()
    vm.startGame(with: ["A", "B", "C", "D", "E"])
    vm.assignedRoles = [.human, .human, .noracat, .robcat, .bosscat]
    vm.currentIndex = 3 // Dさんが泥棒猫という想定
    return BossCatTextView(viewModel: vm)
}
