//
//  HumanView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import SwiftUI

struct HumanView: View {
    // 画面遷移用のフラグ。
    @State private var goToImage = false
    // RoleCheckStartViewModelを引き継いで使わせてもらっている。
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
        
        // HumanViewへ画面遷移。
        .navigationDestination(isPresented: $goToImage) {
            HumanImageView(viewModel: viewModel)
        }
    }
}
