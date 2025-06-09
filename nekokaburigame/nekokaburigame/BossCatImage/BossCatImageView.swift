//
//  BossCatImage.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

import SwiftUI

struct BossCatImageView: View {
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        ZStack {
            Image(.bosscat)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .offset(x: -40)

            VStack(spacing: 20) {
                Text("あなたの役職は…")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(40)
                
                Spacer()
                
                Text("ボス猫です。")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(40)

                NavigationLink(destination: RobCatRoleView(viewModel: viewModel)) {
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
#Preview {
    let vm = RoleCheckStartViewModel()
    vm.startGame(with: ["A", "B", "C", "D", "E"])
    vm.assignedRoles = [.human, .human, .noracat, .robcat, .bosscat]
    vm.currentIndex = 3
    return BossCatImageView(viewModel: vm)
}
