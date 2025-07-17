//
//  BossCatTextView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

/*
 ボス猫が選択したプレイヤーの役職をみられる画面。
 ボス猫が見たプレイヤーを表示。泥棒猫が入れ替えたのを踏まえての処理。
 */

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
                // 選んだプレイヤーのインデックスが有効なのかをチェック。
                if let seen = viewModel.selectedViewedIndex,
                   seen >= 0 && seen < viewModel.playerNames.count,
                   viewModel.currentIndex == viewModel.bossCatIndex {
                    
                    // 選択したプレイヤーの役職がなんなのか
                    let roleToShow = viewModel.displayedRole(at: seen)
                    
                    Text("\(viewModel.playerNames[seen])の役職は「\(roleToShow.displayName)」でした。")
                        .font(.custom("PixelMplus12-Regular", size: 24))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                else if viewModel.currentIndex == viewModel.swappedPlayerIndex,
                        let original = viewModel.originalSwappedRole {
                    Text("あなたの役職は「\(original.displayName)」です。")
                        .font(.custom("PixelMplus12-Regular", size: 24))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                else {
                    Text("表示できる情報がありません。")
                        .foregroundColor(.gray)
                        .padding()
                }
                
                Button(action: {
                    viewModel.goToNextPlayer()
                }) {
                    Text("次のプレイヤーへ")
                        .font(.custom("PixelMplus12-Regular", size: 24))
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
