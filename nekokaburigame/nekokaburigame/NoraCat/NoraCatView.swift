//
//  NoraCatView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/07.
//
import SwiftUI

struct NoraCatView: View {

    @State private var goToImage = false
    var viewModel: RoleCheckStartViewModel
    var body: some View {
        
        VStack(spacing: 20) {
            Text("あなたの役職は・・・")
                .font(.custom("PixelMplus12-Regular", size: 28))
                .multilineTextAlignment(.center)

            Button("次へ") {
                goToImage = true
            }
            .font(.custom("PixelMplus12-Regular", size: 28))
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        
        .navigationDestination(isPresented: $goToImage) {
            NoraCatImageView(viewModel: viewModel)
        }
    }
}
