//
//  VoteCheckView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/18.
//

import SwiftUI

struct VoteCheckView: View {
    let votes: [String]
    let playerNames: [String]
    let assignedRoles: [Role]
    @Binding var path: NavigationPath

    @StateObject private var viewModel: VoteCheckViewModel
    @State private var isGoToAnnouncement = false
    @State private var isGoToTieBreak = false
    @State private var executedPlayerName: String = ""
    @State private var candidatesForTieBreak: [String] = []

    init(votes: [String], playerNames: [String], assignedRoles: [Role], path: Binding<NavigationPath>) {
        self.votes = votes
        self.playerNames = playerNames
        self.assignedRoles = assignedRoles
        self._path = path

        _viewModel = StateObject(wrappedValue: VoteCheckViewModel(votes: votes))
    }

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("全員の投票が完了しました。\n次のページにて、処刑されたプレイヤーを\n発表します。")
                    .font(.title3)
                    .bold()
                    .padding()

                Button("結果発表") {
                    let topCandidates = viewModel.mostVotedPlayers()

                    if topCandidates.count == 1 {
                        let executed = topCandidates.first!
                        path.append(
                            Route.last(
                                playerNames: playerNames,
                                assignedRoles: assignedRoles,
                                originalRoles: assignedRoles,
                                executedPlayerName: executed
                            )
                        )
                    } else {
                        candidatesForTieBreak = topCandidates
                        isGoToTieBreak = true
                    }
                }
                .font(.title2)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
        }

        .navigationDestination(isPresented: $isGoToTieBreak) {
            TieBreakVoteView(
                candidates: candidatesForTieBreak,
                playerNames: playerNames,
                assignedRoles: assignedRoles,
                path: $path
            )
        }
    }
}
