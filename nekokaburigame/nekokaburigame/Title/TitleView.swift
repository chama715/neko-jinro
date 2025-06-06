//
//  TitleView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import SwiftUI

struct TitleView: View {
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
            //  新しい画面遷移の方法
                .navigationDestination(isPresented: $viewModel.isGameStarted) {
                    PlayCountView()
                }
            }
        }
    }
    
    #Preview {
        TitleView()
    }
