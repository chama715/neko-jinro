//
//  RoleCheckStartView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import SwiftUI

struct RoleCheckStartView: View {
    @ObservedObject var viewModel: RoleCheckStartViewModel

    var body: some View {
        ZStack {
            Image(.nikukyu)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .offset(x: -40)

            VStack(spacing: 20) {
                Text("このプレイヤーに\n端末を渡してください。")
                    .font(.title)
                    .foregroundStyle(.white)
                    .frame(maxHeight: 450, alignment: .top)

                // プレイヤー名を表示（動的に変化）
                Text(viewModel.currentPlayerName)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(24)

                Button(action: {
                    viewModel.isGoRoleCheck = true
                }) {
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
        .navigationDestination(isPresented: $viewModel.isGoRoleCheck) {
            switch viewModel.displayedRole {
            case .human: HumanView(viewModel: viewModel)
            case .noracat: NoraCatView(viewModel: viewModel)
            case .robcat: RobCatView(viewModel: viewModel)
            case .bosscat: BossCatView(viewModel: viewModel)
            case .none: Text("役職がみつかりません")
            }
        }

    }
}
