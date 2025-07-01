//
//  VoteStartView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/16.
//

/*
 その名の通り、投票が始まる画面。各プレイヤーに端末を渡させ、ボタンを押すと処刑するプレイヤーを選ぶ画面に。
 プレイヤー名、役職一覧の状態、画面遷移のフラグ2つ、今誰の番かの状態、ViewModel、ナビパスを定義。
 順番に、投票するプレイヤー名が表示されるのでそのプレイヤーに端末を渡す。
 ボタンを押すと投票画面(VoteSelectView)に遷移。しかし全員の投票が終わっていたらVoteCheckViewに遷移する。
 */

import SwiftUI

struct VoteStartView: View {
    let playerNames: [String]
    let assignedRoles: [Role]
    @State private var isGoToVoteSelect = false
    @State private var currentIndex = 0
    @State private var isGoToVoteCheck = false
    @StateObject private var viewModel = VoteStartViewViewModel()
    @Binding var path: NavigationPath


    var body: some View {
        ZStack {
            Image(.nikukyu)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .offset(x: -40)

            VStack(spacing: 20) {
                Text("このプレイヤーに端末を渡してください。")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)

                if currentIndex < playerNames.count {
                    Text(playerNames[currentIndex])
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                }

                Button("OK") {
                    if currentIndex < playerNames.count {
                        isGoToVoteSelect = true
                    } else {
                        isGoToVoteCheck = true
                    }
                }
                .font(.title2)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
            }

            .navigationDestination(isPresented: $isGoToVoteSelect) {
                VoteSelectView(playerNames: playerNames,currentVoterIndex: currentIndex,currentIndex: $currentIndex,isGoToVote: $isGoToVoteSelect,isGoToVoteCheck:$isGoToVoteCheck,startViewModel: viewModel)
            }
            .navigationDestination(isPresented: $isGoToVoteCheck) {
                VoteCheckView(votes: viewModel.votes,playerNames: playerNames,assignedRoles: assignedRoles,path: $path)
            }
        }
    }
}
