//
//  HumanView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import SwiftUI

struct HumanView: View {
    @State private var goToImage = false
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("あなたの役職は\n『人間』です")
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
        .navigationDestination(isPresented: $goToImage) {
            HumanImageView(viewModel: viewModel)
        }
    }
}
