//
//  NoraCatTextView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

/*
 あなたは野良猫だよということを知らせる画面。
 野良猫をroleに代入し、表示。
 あとは画面遷移。
 */

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
                
                let role = viewModel.displayedRole(at: viewModel.currentIndex)
                
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
