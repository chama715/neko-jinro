//
//  BossCatTextView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

import SwiftUI

struct BossCatTextView: View {
    var viewModel: RoleCheckStartViewModel
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                let seen = viewModel.selectedViewedIndex ?? -1
                
                if seen >= 0 && seen < viewModel.playerNames.count && seen < viewModel.assignedRoles.count {
                    Text("\(viewModel.playerNames[seen])の役職は\(viewModel.assignedRoles[seen].displayName)でした。")
                        .font(.title2)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    Text("表示できる情報がありません。")
                        .foregroundColor(.gray)
                        .padding()
                }
                
                
                Button(action: {
                    viewModel.goToNextPlayer()
                }) {
                    Text("次のプレイヤーへ")
                        .font(.title2)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    let vm = RoleCheckStartViewModel()
    vm.startGame(with: ["A", "B", "C", "D", "E"])
    vm.assignedRoles = [.human, .human, .noracat, .robcat, .bosscat]
    vm.currentIndex = 3 // Dさんが泥棒猫という想定
    return BossCatTextView(viewModel: vm)
}
