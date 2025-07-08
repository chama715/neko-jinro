//
//  HumanView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

/*
 あなたの役職は？？とボタンしかないシンプルな画面。ただこの時点で人間と決まっている。プレイヤーにはわからないから大丈夫。
 画面遷移のフラグを準備、ゲームの心臓部分であるRoleCheckStartViewModelを受け取り、役職名、プレイヤー名などを共有する。
 そのほかは難しいことはなく、シンプルに次の画面に進むのみ。
 */

import SwiftUI

struct HumanView: View {
    
    @State private var goToImage = false
    var viewModel: RoleCheckStartViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("あなたの役職は・・・")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Button("次へ") {
                goToImage = true
            }
            .font(.title2)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        
       

        
        .navigationDestination(isPresented: $goToImage) {
            HumanImageView(viewModel: viewModel)
        }
    }
}
