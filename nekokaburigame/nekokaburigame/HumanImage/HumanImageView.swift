//
//  HumanImageView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//


import SwiftUI

struct HumanImageView: View {
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        ZStack {
            Image(.human)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .offset(x: -40)

            VStack(spacing: 20) {
                Text("あなたの役職は…")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(40)
                
                Spacer()
                
                Text("人間です。")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(40)

                NavigationLink(destination: HumanTextView(viewModel: viewModel)) {
                    Text("次へ")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding()
                }
            }
        }
    }
}
