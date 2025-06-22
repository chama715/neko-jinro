//
//  GameReady.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

/*
 ゲーム開始前の画面。
 プレイヤーごとに役職を確認してもらう画面。
 */

import SwiftUI

struct GameReadyView: View {
    // 前画面から受け取ったプレイヤー名の配列。
    let playerNames: [String]
    // GameareadyViewModelというインスタンスを生成。StateObjectとして管理することで、ViewModelの動きを表のViewで反映させられる。
    @StateObject private var viewModel = GameReadyViewModel()
    // ナビゲーションパスを親ビューから受け取っている。ほぼ全ての画面で必要。
    @Binding var path: NavigationPath
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("夜がきました。\n各自役職を確認し\n夜のアクションを行ってください。")
                    .font(.title3)
                    .bold()
                    .padding()
                
                // ボタンを押すとviewModelのstartGameが実行される。引数playerName・
                Button(action: {
                    viewModel.startGame(with: playerNames)
                }) {
                    Text("OK")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }

            // isGameReadyがtrueになったら、RoleCheckStartViewに画面遷移。
            .navigationDestination(isPresented: $viewModel.isGameReady) {
                RoleCheckStartView(path: $path,viewModel: viewModel.rolechekStartviewModel)
            }
            
            // goToVotePhaseがtrueになったら、RoleCheckStartViewに画面遷移。役職確認が終わったら、次の画面へ。
            .navigationDestination(isPresented: $viewModel.goToVotePhase) {
                VoteView(playerNames: playerNames,assignedRoles: Array(viewModel.assignedRoles),path: $path)
            }
        }
    }
}
