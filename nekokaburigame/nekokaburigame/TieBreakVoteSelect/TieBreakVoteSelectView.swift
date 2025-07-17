//
//  TieBreakVoteSelectView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/20.
//

/*
 各プレイヤーが決選投票を行う画面。これは決選投票の対象者もやる。
 決戦投票対象者は誰なのか、全プレイヤー名、誰がどの役職なのか、ナビパスを受け取る。
 決選投票の結果を記録する配列、選択した対象プレイヤー名も保存。
 あとは画面遷移のフラグ。
 投票するプレイヤーをそれぞれ表示して、リストから投票してもらう。
 
 */

import SwiftUI

struct TieBreakVoteSelectView: View {
    let candidates: [String]
    let playerNames: [String]
    let assignedRoles: [Role]
    @Binding var path: NavigationPath
    @State private var currentIndex = 0
    @State private var votes: [String] = []
    @State private var selectedName: String = ""
    @State private var isGoToCheck = false

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                if currentIndex < playerNames.count {
                    Text("\(playerNames[currentIndex]) さん\n投票してください")
                        .font(.custom("PixelMplus12-Regular", size: 24))
                        .bold()
                        .multilineTextAlignment(.center)

                    ForEach(candidates, id: \.self) { name in
                        Button(action: {
                            selectedName = name
                        }) {
                            Text(name)
                                .font(.custom("PixelMplus12-Regular", size: 20))
                                .padding()
                                .frame(width: 350)
                                .background(selectedName == name ? Color.green : Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(12)
                        }
                    }

                    Button("決定して次へ") {
                        SEManager.shared.playSE(named: "button_tap")
                        guard !selectedName.isEmpty else { return }
                        votes.append(selectedName)
                        selectedName = ""
                        if currentIndex < playerNames.count - 1 {
                            currentIndex += 1
                        } else {
                            isGoToCheck = true
                        }
                    }
                    .font(.custom("PixelMplus12-Regular", size: 24))
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                } else {
                    Text("全員の投票が完了しました")
                }
            }
            
        

            
            .padding()
        }
        .navigationDestination(isPresented: $isGoToCheck) {
            VoteCheckView(votes: votes,playerNames: playerNames,assignedRoles: assignedRoles,path: $path)
        }
    }
}
