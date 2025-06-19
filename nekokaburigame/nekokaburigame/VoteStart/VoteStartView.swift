//
//  VoteStartView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/16.
//

import SwiftUI

struct VoteStartView: View {
    let playerNames: [String]
    @State private var isGoToVoteSelect = false
    @State private var currentIndex = 0
    @State private var isGoToVoteCheck = false
    @StateObject private var viewModel = VoteStartViewViewModel()



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
                VoteSelectView(
                    playerNames: playerNames,
                    currentVoterIndex: currentIndex,
                    currentIndex: $currentIndex,
                    isGoToVote: $isGoToVoteSelect,
                    isGoToVoteCheck: $isGoToVoteCheck,
                    startViewModel: viewModel
                )
            }


            .navigationDestination(isPresented: $isGoToVoteCheck) {
                VoteCheckView(votes: viewModel.votes)
            }
        }
    }
}
