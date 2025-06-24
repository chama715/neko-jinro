//
//  RoleCheckStartView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import SwiftUI

struct RoleCheckStartView: View {
    
    // NavigationStackのpathを親ビュー(ContentView)から受け取っている。
    @Binding var path: NavigationPath
    // RoleCheckStartViewModelというインスタンスを生成。このViewの動きは、裏にあるViewModelによって制御されている！
    @ObservedObject var viewModel: RoleCheckStartViewModel
    
    var body: some View {
        ZStack {
            // いつもと違う背景をチョイス。なぜか左右にずれてしまっているので、左に40寄せている。
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
                
                // 今のプレイヤーを表示。
                Text(viewModel.currentPlayerName)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(24)
                
                // 画面遷移用のボタン。trueになり、画面遷移が実行される。
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

        // 通常の画面遷移ではなく、役職ごとに異なる画面に遷移させたいため、switch文を採用。(humanだったらHumanViewみたいな)
        .navigationDestination(isPresented: $viewModel.isGoRoleCheck) {
            switch viewModel.displayedRole {
            case .human: HumanView(viewModel: viewModel)
            case .noracat: NoraCatView(viewModel: viewModel)
            case .robcat: RobCatView(viewModel: viewModel)
            case .bosscat: BossCatView(viewModel: viewModel)
            case .none: Text("役職がみつかりません")
            }
        }
        
        // 全員が役職の確認を終えると、isAllFinishedがtrueになり、次の画面へ遷移する。
        .navigationDestination(isPresented: $viewModel.isAllFinished) {
            RoleCheckEndView(playerNames: viewModel.playerNames,viewModel: viewModel,path: $path)
        }
    }
}
