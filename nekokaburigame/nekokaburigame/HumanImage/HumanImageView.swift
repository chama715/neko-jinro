//
//  HumanImageView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

/*
 人間ですという役職確認画面。人間の画像を使っているので、ロジック的に難しいとかは特にない。なぜか画像がずれてしまうので、左に40ptずらしている。
 RoleCheckStartViewModelを受け取っているので、プレイヤー名などの情報はバッチリ。誰が人間なのかとかを保存しておいてくれる。
 あとはシンプルに画面遷移。HumanTextへ。
 */

import SwiftUI

struct HumanImageView: View {
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        ZStack {
            Image(.human)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .offset(x: -40)

            VStack(spacing: 20) {
                Text("あなたの役職は…")
                    .font(.custom("PixelMplus12-Regular", size: 28))
                    .foregroundColor(.black)
                    .padding(40)
                
                Spacer()
                
                Text("人間です。")
                    .font(.custom("PixelMplus12-Regular", size: 28))
                    .foregroundColor(.black)
                    .padding(40)
                
                NavigationLink(destination: HumanTextView(viewModel: viewModel)) {
                    Text("次へ")
                        .font(.custom("PixelMplus12-Regular", size: 24))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding()
                }
            }
        }
       

    }
}
