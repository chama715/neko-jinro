//
//  NoraCatView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

import SwiftUI

struct NoraCatView: View {
    // シンプルな画面遷移の時はこのくらいでいける。
    @State private var goToImage = false
    // 役職とかを一括管理しているViewModelの力を貸してもらいます。
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("あなたの役職は・・・")
                .font(.largeTitle)
                .multilineTextAlignment(.center)

            Button("次へ") {
                goToImage = true
            }
            .font(.title2)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        // goToImageがtrueになったら次の画面へ！
        .navigationDestination(isPresented: $goToImage) {
            NoraCatImageView(viewModel: viewModel)
        }
    }
}
