//
//  BossCatRoleView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/09.
//

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
                Text("あなたは、地域を支配している\nボス猫です。\nどんな情報でも知っている\n最強の猫。")
                    .font(.custom("PixelMplus12-Regular", size: 24))
                    .multilineTextAlignment(.center)
                    .padding()

                Text("ボス猫は、他のプレイヤーの役職を\n1人だけみることができます。")
                    .font(.custom("PixelMplus12-Regular", size: 24))
                    .multilineTextAlignment(.center)
                    .padding()

                Text("役職を見たいプレイヤーを\n選択してください。")
                    .font(.custom("PixelMplus12-Regular", size: 24))
                    .multilineTextAlignment(.center)
                    .padding()
                
                ForEach(Array(viewModel.playerNames.enumerated()), id: \.offset) { index, name in
                    if index != viewModel.currentIndex {
                        
                        HStack {
                            Text(name)
                                .font(.custom("PixelMplus12-Regular", size: 20))
                                .foregroundStyle(.black)
                                .padding()
                            
                            NavigationLink(destination: BossCatTextView(viewModel: viewModel),tag: index,selection: $selectedIndex) {
                                EmptyView()
                            }
                            
                            Button("役職を見る") {
                                viewModel.selectedViewedIndex = index
                                selectedIndex = index
                            }
                            .font(.custom("PixelMplus12-Regular", size: 16))
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
