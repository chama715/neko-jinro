//
//  TieBreakView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/20.
//

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
                    .font(.custom("PixelMplus12-Regular", size: 20))
                    .bold()
                    .padding()
                
                Text("決選投票を行うのは\n" + candidates.joined(separator: " と ") + " です。")
                    .font(.custom("PixelMplus12-Regular", size: 20))
                    .bold()
                    .padding()
                    .underline()
                
                Button(action: {
                    SEManager.shared.playSE(named: "button_tap")
                    isGoToVote = true
                }) {
                    Text("決選投票画面へ")
                        .font(.custom("PixelMplus12-Regular", size: 24))
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
