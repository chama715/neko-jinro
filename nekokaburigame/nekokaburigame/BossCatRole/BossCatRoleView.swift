//
//  BossCatRoleView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/09.
//

/*
 ボス猫が役職を見る画面。他のプレイヤーの名前と、役職を見るボタンが配置されている。
 RoleCheckStartViewModelは引き続き受け取り、どのプレイヤーの役職を見たか、の状態を持っておく。
 ForEach、HStackでリストを作り選択できるように。選択したら次の画面で、誰がなんだったかがわかる。
 NavigationLinkが非推奨と出ているが、いじると色々なところでエラーがでてしまうので、動いているしまあいいか。という感じ。
 */

import SwiftUI

struct BossCatRoleView: View {
    var viewModel: RoleCheckStartViewModel
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
                
                ForEach(Array(viewModel.playerNames.enumerated()), id: \.offset) { index, name in
                    if index != viewModel.currentIndex {
                        
                        HStack {
                            Text(name)
                                .font(.title3)
                                .bold()
                                .foregroundStyle(.black)
                                .padding()
                            
                            NavigationLink(destination: BossCatTextView(viewModel: viewModel),tag: index,selection: $selectedIndex) {
                                EmptyView()
                            }
                            
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
