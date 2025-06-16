//
//  DiscussionView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/15.
//

import SwiftUI

struct DiscussionView: View {
    let playerNames: [String]
    @StateObject private var viewModel = DiscussionViewModel()

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 40) {
                if viewModel.isTimerRunning {

                    // trueつまりタイマーが動いているなら、timeStringを表示。
                    Text(viewModel.timeString)
                        .font(.system(size: 60, weight: .bold, design: .monospaced))
                        .padding()
                    // falseつまりタイマーが動いていなければ、以下の処理
                } else {

                    HStack {
                        // 分を選択。デフォは3分にした。0〜60まであるが、5分とかでいい気もする。
                        Picker("分", selection: $viewModel.selectedMinutes) {
                            ForEach(0..<60) { Text("\($0)分") }
                        }
                        .frame(width: 100)
                        .clipped()

                        // 秒を選択。デフォは0。0〜60秒を選択。
                        Picker("秒", selection: $viewModel.selectedSeconds) {
                            ForEach(0..<60) { Text("\($0)秒") }
                        }
                        .frame(width: 100)
                        .clipped()
                    }
                    .pickerStyle(.wheel)
                }

                // ボタンを押すと{}の処理を実行
                Button(action: {
                    // タイマーが動いていれば、終了処理（＝stop & 遷移）
                    if viewModel.isTimerRunning {
                        viewModel.endDiscussion() 
                    } else {
                        viewModel.startTimer()
                    }
                }) {
                    Text(viewModel.isTimerRunning ? "話し合いを終了" : "話し合いを開始")
                        .font(.title2)
                        .padding()
                        .frame(width: 220)
                        .background(viewModel.isTimerRunning ? Color.red : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }

            }
            .padding()
        }
        .navigationDestination(isPresented: $viewModel.isDiscussionFinished) {
                        VoteView(playerNames: playerNames)
                    }
    }
}
