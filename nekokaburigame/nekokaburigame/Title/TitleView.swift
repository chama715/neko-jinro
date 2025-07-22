//
//  TitleView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

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

                Text("ねこ人狼")
                    .font(.custom("PixelMplus12-Regular", size: 48))
                
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
                        .font(.custom("PixelMplus12-Regular", size: 32))
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
                        .font(.custom("PixelMplus12-Regular", size: 32))
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
