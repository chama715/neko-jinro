//
//  VoteSelectView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/16.
//

/*
 各プレイヤーが実際に投票をする場面。
 今誰なのかを表示して、投票するプレイヤーをリスト表示し、それぞれ投票ボタンを横に並べる。
 プレイヤー名の配列、何番目の人が投票しているのかを保存する定数、画面遷移のフラグ、ViewModelのやつを定義しておく。
 今誰なのかを表示して確認。そして投票。
 リストから選んだプレイヤーをタップして選ぶと、その人がviewModelに記録され、そして青いチェックマークがつく。
 次のプレイヤーがいればそのプレイヤーに渡すようの画面に遷移。全員投票が済んでいたら次の画面へ遷移。
 アプリクラッシュが発生したため、デスパッチクエクエで遅延させる。
 
 */

import SwiftUI

struct VoteSelectView: View {
    let playerNames: [String]
    let currentVoterIndex: Int
    @Binding var currentIndex: Int
    @Binding var isGoToVote: Bool
    @Binding var isGoToVoteCheck: Bool
    @ObservedObject var startViewModel: VoteStartViewViewModel
    @StateObject private var viewModel = VoteSelectViewModel()

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                if currentVoterIndex < playerNames.count {
                    Text("あなたは \(playerNames[currentVoterIndex]) ですね。\n処刑するプレイヤーを選んでください。")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    Text("プレイヤー情報が取得できませんでした。")
                        .foregroundColor(.red)
                }

                List(playerNames, id: \.self) { name in
                    Button(action: {
                        viewModel.selectedPlayer = name
                    }) {
                        HStack {
                            Text(name)
                            Spacer()
                            if viewModel.selectedPlayer == name {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                .frame(width: 400, height: 300)

                Button("投票&次のプレイヤーへ") {
                    if let selected = viewModel.selectedPlayer {
                        startViewModel.recordVote(for: selected) 
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        if currentIndex + 1 < playerNames.count {
                            currentIndex += 1
                            isGoToVote = false
                        } else {
                            isGoToVote = false
                            isGoToVoteCheck = true
                        }
                    }
                }
                .font(.title2)
                .padding()
            }
            
           

            
            .padding()
        }
    }
}
