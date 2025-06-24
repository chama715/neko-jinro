//
//  BossCatRoleView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/09.
//

import SwiftUI

struct BossCatRoleView: View {
    //　RoleCheckStartViewModelを引き継ぎ。
    var viewModel: RoleCheckStartViewModel
    
    // ボス猫がどのプレイヤーを選ぶか、を保存しておく状態。
    @State private var selectedIndex: Int? = nil

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("あなたは、地域を支配している\nボス猫です。\nどんな情報でも知っている最強の猫。")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()

                Text("ボス猫は、他のプレイヤーの役職を\n1人だけみることができます。")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()

                Text("役職を見たいプレイヤーを\n選択してください。")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()

                // プレイヤー一覧。
                ForEach(Array(viewModel.playerNames.enumerated()), id: \.offset) { index, name in
                    if index != viewModel.currentIndex {

                        // 名前と見るボタンを横並びに。
                        HStack {
                            Text(name)
                                .font(.title3)
                                .bold()
                                .foregroundStyle(.black)
                                .padding()
                            
                            // 画面遷移
                            NavigationLink(
                                destination: BossCatTextView(viewModel: viewModel),tag: index,selection: $selectedIndex) {
                                EmptyView()
                            }
                            
                            // ボタンを押すと、選んだプレイヤーのインデックスをViewModelに記録しておく処理を実行。
                            Button("役職を見る") {
                                viewModel.selectedViewedIndex = index
                                selectedIndex = index
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}
