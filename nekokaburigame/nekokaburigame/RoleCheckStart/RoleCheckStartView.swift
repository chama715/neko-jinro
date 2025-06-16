//
//  RoleCheckStartView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import SwiftUI

struct RoleCheckStartView: View {
    // viewModelを監視しているし、がちゃんこしている。
    @ObservedObject var viewModel: RoleCheckStartViewModel
    
    var body: some View {
        ZStack {
            Image(.nikukyu)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            // 画面がなぜか右よりになってしまっていたので、左に寄せた。
                .offset(x: -40)
            
            VStack(spacing: 20) {
                Text("このプレイヤーに\n端末を渡してください。")
                    .font(.title)
                    .foregroundStyle(.white)
                    .frame(maxHeight: 450, alignment: .top)
                
                // 各プレイヤー名を表示して、端末を渡させる。
                Text(viewModel.currentPlayerName)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(24)
                
                // ボタンを押したら、viewModelのisGoRoleCheckがtrueになる。
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
        // ボタンを押してisGoRoleCheckがtrueになると、画面遷移が実行される。
        .navigationDestination(isPresented: $viewModel.isGoRoleCheck) {
            // 役職ごとに表示する画面が変わるので、switch文で。
            // からの、泥棒猫に役職を奪われたプレイヤーは奪われる前の役職を表示するようにしている。これやるのに5年かかった。
            switch viewModel.displayedRole {
            case .human: HumanView(viewModel: viewModel) // Humanだったら、HUmanView
            case .noracat: NoraCatView(viewModel: viewModel) // NoraCatだったら、NoraCatView
            case .robcat: RobCatView(viewModel: viewModel) // RobCatだったら、RobCatView
            case .bosscat: BossCatView(viewModel: viewModel) // BossCatだったら、BossCatView
            case .none: Text("役職がみつかりません") // なければ、なし。
            }
        }
        .navigationDestination(isPresented: $viewModel.isAllFinished) {
            RoleCheckEndView(playerNames: viewModel.playerNames)
        }
        
        
    }
}
