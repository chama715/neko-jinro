//
//  NoraCatView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//

/*
この画面も難しいことはなく、画面遷移のみ。
 NavigationLinkなので、フラグは必要なし。
 */

import SwiftUI

struct NoraCatImageView: View {
    var viewModel: RoleCheckStartViewModel

    var body: some View {
        ZStack {
            Image(.noracat)
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
                
                Text("野良猫です。")
                    .font(.custom("PixelMplus12-Regular", size: 28))
                    .foregroundColor(.black)
                    .padding(40)
                
                NavigationLink(destination: NoraCatTextView(viewModel: viewModel)) {
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
