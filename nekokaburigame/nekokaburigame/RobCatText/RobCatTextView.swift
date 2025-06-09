//
//  RobCatTextView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

import SwiftUI

struct RobCatTextView: View {
    var viewModel: RoleCheckStartViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                ZStack {
                    Image(.background)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                    VStack(spacing: 30) {
                        Text("役職を入れ替えた相手は\n\(viewModel.playerNames[viewModel.swappedPlayerIndex ?? 0]) です。")
                            .font(.title2)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Text("\(viewModel.playerNames[viewModel.swappedPlayerIndex ?? 0])の役職は\(viewModel.swappedPlayerOriginalRole?.rawValue ?? "不明")でした。")
                            .font(.title3)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Button(action: {
                            viewModel.goToNextPlayer()
                        }) {
                            Text("次のプレイヤーへ")
                                .font(.title2)
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
    }
}
#Preview {
    let vm = RoleCheckStartViewModel()
    vm.startGame(with: ["A", "B", "C", "D", "E"])
    vm.assignedRoles = [.human, .human, .noracat, .robcat, .bosscat]
    vm.currentIndex = 3 // Dさんが泥棒猫という想定
    return RobCatTextView(viewModel: vm)
}
