//
//  BossCatRoleView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/09.
//

import SwiftUI

struct BossCatRoleView: View {
    var viewModel: RoleCheckStartViewModel
    // 選んだプレイヤーを保存するための状態。デフォはなし。
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

                // プレイヤー一覧を表示。
                ForEach(Array(viewModel.playerNames.enumerated()), id: \.offset) { index, name in

                    // 自分は表示させない。
                    if index != viewModel.currentIndex {
                        // 名前と見るボタンを横並びにする。
                        HStack {
                            Text(name)
                                .font(.title3)
                                .bold()
                                .foregroundStyle(.black)
                                .padding()
                            
                            // いじるとエラーが起きてしまう。。
                            NavigationLink(
                                destination: BossCatTextView(viewModel: viewModel),
                                tag: index,
                                selection: $selectedIndex
                            ) {
                                EmptyView()
                            }
                            // ボタンを押すと選んだプレイヤーが記録され、画面遷移して役職を確認できる。
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
