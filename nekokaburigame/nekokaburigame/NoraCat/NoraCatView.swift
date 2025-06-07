//
//  NoraCatView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

import SwiftUI

struct NoraCatView: View {
    @State private var goToImage = false
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
        .navigationDestination(isPresented: $goToImage) {
            NoraCatImageView(viewModel: viewModel)
        }
    }
}
#Preview {
    let vm = RoleCheckStartViewModel()
    vm.startGame(with: ["A", "B", "C", "D", "E"])
    vm.assignedRoles = [.human, .human, .noracat, .robcat, .bosscat]
    vm.currentIndex = 2 // 例：Cさんが野良猫
    return NoraCatView(viewModel: vm)
}
