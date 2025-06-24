//
//  TitleView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

/*
 1番最初の画面。必要なスキルは画面遷移くらいだが、ここから全てがはじまる。
 タイトル、肉球ともに変更したいと思っている。可能ならまさきの案も聞いてみたい。
 */

import SwiftUI

// タイトル画面の構造体。Viewプロトコルに準拠している。
struct TitleView: View {
    
    @Binding var path: NavigationPath
    @StateObject private var viewModel = TitleViewModel()
    
    var body: some View {

        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {

                Text("猫被りゲーム")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Image(systemName: "pawprint.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)

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
            
            .navigationDestination(isPresented: $viewModel.isGameStarted) {
                PlayCountView(path: $path)
            }
        }
    }
}
