//
//  TitleView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

//

import SwiftUI

// TitleViewという画面を定義。Viewのファイルは全てこれからはじまるのである。
struct TitleView: View {
    // ObseevableObjectのクラスの所有権を持っているというか、監視できるというか。
    @StateObject private var viewModel = TitleViewModel()
    
    var body: some View {
        // 背景を差し込み。ZStackにして前後の関係。
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // タイトルのサムネ。デカ文字&太字。
                Text("猫被りゲーム")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // 肉球マーク。ここ変更してインパクト大にしてもいいかも。
                Image(systemName: "pawprint.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)
                
                // このボタンを押すと、ゲームスタートするよ！ってやつ。ボタンを押すことで、ViewModelのstartGame()が実行される。
                Button(action: {
                    viewModel.startGame()
                }) {
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
            //  新しい画面遷移の方法。.navigationDestination(isPresented:$フラグ) { 遷移先のView() }を遷移元のViewに入力。ViewModelにデフォがfalseの状態変数と、フラグがtrueになる関数をセットする。
            .navigationDestination(isPresented: $viewModel.isGameStarted) {
                PlayCountView()
            }
        }
    }
}

#Preview {
    TitleView()
}
