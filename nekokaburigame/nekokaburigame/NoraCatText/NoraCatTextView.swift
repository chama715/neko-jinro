//
//  NoraCatTextView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

/*
 あなたは野良猫だよということを知らせる画面。
 let roleは泥棒猫に入れ替えられたことを考慮して、入れ替え前の役職をきちんと表示させるための定数。
用が済んでボタンを押せば、画面が戻る。
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
                    .font(.custom("PixelMplus12-Regular", size: 24))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()

                Text("野良猫には特別なアクションはありません。\n話し合いで人間を見つけ出しましょう！")
                    .font(.custom("PixelMplus12-Regular", size: 18))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                
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
