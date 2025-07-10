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

                Text("猫人狼")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Image(systemName: "pawprint.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)

                Button(action: {
                    SEManager.shared.playSE(named: "button_tap")
                    BGMManager.shared.stopBGM()
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
                
                Button(action: {
                    SEManager.shared.playSE(named: "button_tap")
                    
                    path.append(Route.rule)
                }) {
                    Text("ルール説明")
                        .font(.title2)
                        .padding()
                        .background(Color.green)
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
        .onAppear {
            BGMManager.shared.playBGM(named: "title_bgm")
        }
        .onDisappear {
        }
    }
}
