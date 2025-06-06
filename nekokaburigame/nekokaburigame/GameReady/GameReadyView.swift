//
//  GameReady.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import SwiftUI

struct GameReadyView: View {
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("夜がきました。\n各自役職を確認し\n夜のアクションを行ってください。")
                    .font(.title3)
                    .bold()
                    .padding()
            
                Button(action: {
                    // 各自役職確認画面へ
                }) {
                    Text("OK")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    GameReadyView()
}
