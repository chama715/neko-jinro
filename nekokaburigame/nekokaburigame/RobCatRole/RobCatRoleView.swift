//
//  RobCatRoleView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/09.
//

import SwiftUI

struct RobCatRoleView: View {
    @ObservedObject var viewModel: RoleCheckStartViewModel

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("あなたは、あらゆるものを\n盗んでしまう泥棒猫です。\n今回は、他のプレイヤーと\n役職を入れ替えてしまいましょう！")
                    .font(.title2)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)

                Text("役職を入れ替えるプレイヤーを選んでください")
                    .font(.title3)
                    .foregroundColor(.black)

                ForEach(viewModel.playerNames.indices, id: \.self) { index in
                    if index != viewModel.currentIndex {
                        HStack {
                            Text(viewModel.playerNames[index])
                                .font(.body)
                                .foregroundColor(.black)

                            Button("入れ替える") {
                                viewModel.swapRole(with: index)
                            }
                            .padding(8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                }
            }
            .padding()
        }
        
        .navigationDestination(isPresented: $viewModel.isGoRobCatText) {
            RobCatTextView(viewModel: viewModel)
        }
    }
}
#Preview {
    NavigationStack {
        let vm = RoleCheckStartViewModel()
        vm.startGame(with: ["A", "B", "C", "D", "E"])
        vm.assignedRoles = [.human, .human, .noracat, .robcat, .bosscat]
        vm.currentIndex = 3 // Dが泥棒猫
        return RobCatRoleView(viewModel: vm)
    }
}
