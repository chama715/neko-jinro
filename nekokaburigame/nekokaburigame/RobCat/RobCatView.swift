//
//  RobCatView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

import SwiftUI

struct RobCatView: View {
    // 画面遷移のためのフラグ。
    @State private var goToImage = false
    // ViewModelを引き継ぎ。
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("あなたの役職は・・・")
                .font(.largeTitle)
                .multilineTextAlignment(.center)

                // 画面遷移。
            Button("次へ") {
                goToImage = true
            }
            .font(.title2)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        // 画面遷移。
        .navigationDestination(isPresented: $goToImage) {
            RobCatImageView(viewModel: viewModel)
        }
    }
}
