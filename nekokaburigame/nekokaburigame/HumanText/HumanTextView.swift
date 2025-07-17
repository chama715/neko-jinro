//
//  HumanTextView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

/*
 プレイヤーが人間だった時、もう一人は誰なのかを確認する画面。
 引き続きRoleCheckStartViewModelを受け取っている。
 今表示すべき役職(入れ替え前、なければ普通に)を取得して表示する。そしてそれをはめ込んであなたの役職は〜〜と表示させる。
 そしてもう1人の人間をViewModelから教えてもらって、表示させる。
 そして次のプレイヤーへ、画面遷移。
 */

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
                    .font(.custom("PixelMplus12-Regular", size: 28))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                
                if !viewModel.otherHumanName().isEmpty {
                    Text("もう1人の人間は \(viewModel.otherHumanName()) です。")
                        .font(.custom("PixelMplus12-Regular", size: 24))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                Text("あなたともう1人の人間が\nどちらも投票されなかった場合\n人間チームの勝利となります。")
                    .font(.custom("PixelMplus12-Regular", size: 24))
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
