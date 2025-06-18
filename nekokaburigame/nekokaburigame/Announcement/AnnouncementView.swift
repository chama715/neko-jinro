//
//  AnnouncementView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/18.
//

import SwiftUI

struct AnnouncementView: View {
    
    let executedPlayerName: String
    
    @StateObject private var viewModel = AnnouncementViewModel()
    @State private var isGoToAnnouncement = false
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("投票の結果、以下のプレイヤーが\n処刑されることになりました。")
                    .font(.title3)
                    .bold()
                    .padding()
                
                Text(executedPlayerName)
                    .font(.title)
                    .bold()
                    .padding()
                    .underline()
                
                Button(action: {
                    isGoToAnnouncement = true
                }) {
                    Text("結果発表")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
        }
       // 画面遷移(あれば)
    }
}
