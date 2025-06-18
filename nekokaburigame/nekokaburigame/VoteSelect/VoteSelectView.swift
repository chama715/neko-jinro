//
//  VoteSelectView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/16.
//
import SwiftUI

struct VoteSelectView: View {
    let playerNames: [String]
    let currentVoterIndex: Int
    @Binding var currentIndex: Int
    @Binding var isGoToVote: Bool
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
                    viewModel.vote(for: viewModel.selectedPlayer)
                    currentIndex += 1
                    isGoToVote = false
                }
                .font(.title2)
                .padding()
            }
            .padding()
        }
    }
}
