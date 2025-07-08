//
//  LastPageView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/19.
//

/*
 その名の通り、最後のページ。
 勝敗を表示して、ボタンを押すとタイトルに戻る。
 viewModel、ナビパスの状態を定義。
 viewModelで計算された結果を表示して、プレイヤーごとに勝ち負けも表示する。役職がなんだったかも表示。
 ボタンを押すとナビゲーション履歴がリセットされ、タイトル画面に遷移。
 */

import SwiftUI

struct LastPageView: View {
    @ObservedObject var viewModel: LastPageViewModel
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                Text("結果発表")
                    .font(.largeTitle)
                    .bold()
                    .underline()
                    .padding(.top)
                
                Text(viewModel.winnerText)
                    .font(.title)
                    .foregroundColor(.red)
                    .padding(.bottom, 20)
                
                ForEach(viewModel.playerResults, id: \.name) { name, role, result in
                    HStack {
                        Text(name)
                            .bold()
                        Text(role.displayName)
                        Text(result)
                            .foregroundColor(result == "勝ち！" ? .green : .red)
                            .underline()
                    }
                    .font(.title3)
                    .padding(.horizontal, 32)
                }
                
                Spacer().frame(height: 30)
                
                Button("タイトルに戻る") {
                    SEManager.shared.playSE(named: "button_tap")
                    
                    path = NavigationPath()
                }
                .font(.title2)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
            .padding()
        }
        .onAppear {
            BGMManager.shared.playBGM(named: "lastpage_bgm")
        }
        .onDisappear {
            BGMManager.shared.stopBGM()
        }
    }
}
