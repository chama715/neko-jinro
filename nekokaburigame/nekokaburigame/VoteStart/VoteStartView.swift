//
//  VoteStartView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/16.
//

import SwiftUI

struct VoteStartView: View {
    @State private var isGoToVote = false

    @StateObject private var viewModel = VoteStartViewViewModel()
    var body: some View {
        ZStack {
            Image(.nikukyu)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("このプレイヤーに端末を渡してください。")
                    .font(.title3)
                    .bold()
                    .padding()
                
                Button(action: {
                    isGoToVote = true
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
            .navigationDestination(isPresented: $isGoToVote) {
                            VoteSelectView()
                        }
        }
    }
}
