//
//  DiscussionView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/15.
//

/*
 話し合いの画面。時間を設定してボタンを押すとカウントダウンで話し合い開始。時間は変更できる。
 時間切れ、あるいはボタンを押すと次の画面へ。
 タイマーが作動している時は残り時間を表示し、作動していない時はPickerで時間を決められる。
 ボタンは、if-else文にて2つの機能があり、タイマーが作動中に押すと画面遷移。停止中に押すとタイマー作動。
 
 */

import SwiftUI

struct DiscussionView: View {
    let playerNames: [String]
    let assignedRoles: [Role]
    @Binding var path: NavigationPath
    @StateObject private var viewModel = DiscussionViewModel()

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 40) {
                if viewModel.isTimerRunning {
                    
                    Text(viewModel.timeString)
                        .font(.system(size: 60, weight: .bold, design: .monospaced))
                        .padding()
                } else {
                    HStack {
                        Picker("分", selection: $viewModel.selectedMinutes) {
                            ForEach(0..<60) { Text("\($0)分") }
                        }
                        .frame(width: 100)
                        .clipped()
                        
                        Picker("秒", selection: $viewModel.selectedSeconds) {
                            ForEach(0..<60) { Text("\($0)秒") }
                        }
                        .frame(width: 100)
                        .clipped()
                    }
                    .pickerStyle(.wheel)
                }
                
                Button(action: {
                    SEManager.shared.playSE(named: "button_tap")
                    if viewModel.isTimerRunning {
                        viewModel.endDiscussion() 
                    } else {
                        viewModel.startTimer()
                    }
                }) {
                    Text(viewModel.isTimerRunning ? "話し合いを終了" : "話し合いを開始")
                        .font(.custom("PixelMplus12-Regular", size: 24))
                        .padding()
                        .frame(width: 220)
                        .background(viewModel.isTimerRunning ? Color.red : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding()
        }
        
        .onAppear {
            BGMManager.shared.playBGM(named: "discussion_bgm")
        }
        .onDisappear {
            BGMManager.shared.stopBGM()
        }

        .navigationDestination(isPresented: $viewModel.isDiscussionFinished) {
            VoteView(playerNames: playerNames,assignedRoles: assignedRoles,path: $path)
        }
    }
}
