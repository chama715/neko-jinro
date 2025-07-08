//
//  GameReady.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

/*
 ゲーム開始前の画面。
 プレイヤーごとに役職を確認してもらう画面。
 前の画面で作成したプレイヤー名の配列を引き継ぎするプロパティ、ViewModelのプロパティ、タイトル戻りのためのプロパティを定義。
 ボタンを押すと、各プレイヤー用の役職確認画面に遷移。全員確認が終わったら、話し合いの画面へ推移。
 */

import SwiftUI

struct GameReadyView: View {
    let playerNames: [String]
    @StateObject private var viewModel = GameReadyViewModel()
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
                
                Button(action: {
                    SEManager.shared.playSE(named: "button_tap")
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
                

            .navigationDestination(isPresented: $viewModel.isGameReady) {
                RoleCheckStartView(path: $path,viewModel: viewModel.rolechekStartviewModel)
            }
            
            .navigationDestination(isPresented: $viewModel.goToVotePhase) {
                VoteView(playerNames: playerNames,assignedRoles: Array(viewModel.assignedRoles),path: $path)
            }
        }
    }
}
