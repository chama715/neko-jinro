//
//  RoleCheckStartView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import SwiftUI

struct RoleCheckStartView: View {
    @StateObject private var viewModel = RoleCheckStartViewModel()
    var body: some View {
        ZStack {
            Image(.nikukyu)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .offset(x: -40)
            
            VStack(spacing: 20) {
                Text("このプレイヤーに\n端末を渡してください。")
                    .font(.title)
                    .foregroundStyle(.white)
                    .frame(maxHeight: 450, alignment: .top)
                
                // プレイヤーごとに変えたい
                Text("プレイヤー名")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(24)
                
                Button(action: {
                    viewModel.startGame()
                }) {
                    Text("次へ")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
        }
        .navigationDestination(isPresented: $viewModel.isGoRoleCheck) {
            HumanView()
        }
    }
}

#Preview {
    RoleCheckStartView()
}
