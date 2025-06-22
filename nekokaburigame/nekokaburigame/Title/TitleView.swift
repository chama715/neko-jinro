//
//  TitleView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import SwiftUI

// タイトル画面の構造体。Viewプロトコルに準拠している。
struct TitleView: View {
    // ContentView(親ビュー)からもらったNavigationPathを双方向にやり取りできるよう、Bindingで保持。読み取りOK書き換えOK
    @Binding var path: NavigationPath
    // TitleViewModelというインスタンスを生成。StateObjectとして管理することで、ViewModelの動きを表のViewで反映させられる。
    @StateObject private var viewModel = TitleViewModel()
    
    // 画面これから作ってくよ！の感じ。
    var body: some View {

        // 背景。ZStackで前後のやつ。背景の上から文字やボタンなどを配置する。
        ZStack {
            // 画像の読み込み、サイズの自動調節、画面いっぱいに表示。iPhoneの画面全体に表示。
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // タイトル。大きな文字で、太字で。
                Text("猫被りゲーム")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // 教えてもらったやつで、肉球マークを配置。大きさの調節と色の変更。
                Image(systemName: "pawprint.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)

                // ボタンを押すと{}内のアクションが実行される。今回はviewModelのstartGame()が実行される。
                Button(action: {
                    // isGameStarted(デフォがfalse)をtrueに変更する関数を呼び出し、画面遷移を行う。
                    viewModel.startGame()
                }) {
                    // ボタンに文字を入れている。角を丸く。
                    Text("GAME START")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
            .padding()

            // isGameStartedがtrueになると画面遷移する。
            .navigationDestination(isPresented: $viewModel.isGameStarted) {
                // 次の画面であるPlayCountViewにNavigationPathを渡す。
                PlayCountView(path: $path)
            }

        }
    }
}
