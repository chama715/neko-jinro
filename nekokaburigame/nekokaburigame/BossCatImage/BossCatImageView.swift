//
//  BossCatImage.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

import SwiftUI

struct BossCatImageView: View {
    var viewModel: RoleCheckStartViewModel
    var body: some View {
        
        ZStack {
            Image(.bosscat)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .offset(x: -40)

            VStack(spacing: 20) {
                Text("あなたの役職は…")
                    .font(.custom("PixelMplus12-Regular", size: 28))
                    .foregroundColor(.black)
                    .padding(40)
                
                Spacer()
                
                Text("ボス猫です。")
                    .font(.custom("PixelMplus12-Regular", size: 28))
                    .foregroundColor(.black)
                    .padding(40)
                
                NavigationLink(destination: BossCatRoleView(viewModel: viewModel)) {
                    Text("次へ")
                        .font(.custom("PixelMplus12-Regular", size: 24))
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
