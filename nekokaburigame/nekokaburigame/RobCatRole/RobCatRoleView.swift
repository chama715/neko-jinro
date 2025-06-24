//
//  RobCatRoleView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/09.
//

import SwiftUI

struct RobCatRoleView: View {

    // ViewModelを外部から受け取る。引き継ぎ。
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

                // viewmodelのプレイヤー名の数のインデックスを使い、繰り返しの処理。
                ForEach(viewModel.playerNames.indices, id: \.self) { index in
                    // 自分は選ばない。
                    if index != viewModel.currentIndex {
                        // 名前と入れ替えるぼんたんを横並びに。
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

        // 画面遷移。
        .navigationDestination(isPresented: $viewModel.isGoRobCatText) {
            RobCatTextView(viewModel: viewModel)
        }
    }
}
