//
//  NoraCatView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

import SwiftUI

struct NoraCatImageView: View {
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        ZStack {
            Image(.nikukyu)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("あなたの役職は…")
                    .font(.title)
                    .foregroundColor(.white)

                Image("human_role") // あなたが用意した人間の画像名に置き換えてください
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)

                NavigationLink(destination: HumanTextView(viewModel: viewModel)) {
                    Text("次へ")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
        }
    }
}
