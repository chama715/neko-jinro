//
//  TieBreakView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/20.
//

/*
 決選投票の画面。
 決選投票の対象となるプレイヤー、全員の配列、全員の役職、ナビパスを定義し、決選投票画面へのフラグも。
 決選投票の対象のプレイヤーを表示し、ボタンを押して遷移。
 */

import SwiftUI

struct TieBreakVoteView: View {
    let candidates: [String]
    let playerNames: [String]
    let assignedRoles: [Role]
    @Binding var path: NavigationPath
    @State private var isGoToVote = false

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("同票数のプレイヤーがいたため\n決選投票を行います。")
                    .font(.title3)
                    .bold()
                    .padding()
                
                Text("決選投票を行うのは\n" + candidates.joined(separator: " と ") + " です。")
                    .font(.title3)
                    .bold()
                    .padding()
                    .underline()
                
                Button(action: {
                    isGoToVote = true
                }) {
                    Text("決選投票画面へ")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
        }
        .navigationDestination(isPresented: $isGoToVote) {
            TieBreakVoteSelectView(candidates: candidates,playerNames: playerNames,assignedRoles: assignedRoles,path: $path)
        }
    }
}
