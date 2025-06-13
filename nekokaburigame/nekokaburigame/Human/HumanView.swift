//
//  HumanView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

// 超シンプルな画面。特にテクニックは必要ない。

import SwiftUI

struct HumanView: View {
    // これがtrueになったら、画面遷移する。
    @State private var goToImage = false
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("あなたの役職は・・・")
                .font(.largeTitle)
                .multilineTextAlignment(.center)

            // goToImageをtrueにして、画面遷移。HumanImage画面へ。
            Button("次へ") {
                goToImage = true
            }
            .font(.title2)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .navigationDestination(isPresented: $goToImage) {
            HumanImageView(viewModel: viewModel)
        }
    }
}
