//
//  RobCatTextView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

/*
前の画面で役職を入れ替えた相手が誰だったかを表示。
 その入れ替えた相手がなんの役職だったかも表示。
 確認を終えたら次の画面へ。
 */

import SwiftUI

struct RobCatTextView: View {
    
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 30) {
                //
                if let swappedIndex = viewModel.swappedPlayerIndex,
                   swappedIndex < viewModel.playerNames.count,
                   let originalRole = viewModel.swappedPlayerOriginalRole {
                    
                    Text("役職を入れ替えた相手は\n\(viewModel.playerNames[swappedIndex]) です。")
                        .font(.custom("PixelMplus12-Regular", size: 28))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("\(viewModel.playerNames[swappedIndex]) の役職は \(originalRole.displayName) でした。")
                        .font(.custom("PixelMplus12-Regular", size: 24))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    Text("役職情報を取得できませんでした。")
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
