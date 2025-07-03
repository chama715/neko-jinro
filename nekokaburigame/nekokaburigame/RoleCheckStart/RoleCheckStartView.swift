//
//  RoleCheckStartView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

/*
 前半部分の心臓となる部分。
 各プレイヤーに端末を渡すように指示を出し、画面遷移がプレイヤーごとにランダムに変わる。(役職確認が行われる)
 全員の役職の確認が終わったら、RoleCheckEndViewに遷移して、さあこれから話し合いが始まるぞ！となる。
 NavigationPathをContentViewから受け取り、RoleCheckStartViewModelも。
 テキストには今端末を渡すべき人の名前を表示させて、ボタンを押すとViewModelの関数を実行し、それぞれの役職画面へ遷移。
 switch文で、5つに分岐し、エラーが出たら役職が見つかりません(ないけど)
 全員の役職確認がおわったら、諸々を渡してRoleCheckEndViewへ遷移。
 */

import SwiftUI

struct RoleCheckStartView: View {
    
    @Binding var path: NavigationPath
    @ObservedObject var viewModel: RoleCheckStartViewModel
    
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
                
                Text(viewModel.currentPlayerName)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(24)
                
                Button(action: {
                    SEManager.shared.playSE(named: "button_tap")
                    viewModel.isGoRoleCheck = true
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
            switch viewModel.displayedRole {
            case .human: HumanView(viewModel: viewModel)
            case .noracat: NoraCatView(viewModel: viewModel)
            case .robcat: RobCatView(viewModel: viewModel)
            case .bosscat: BossCatView(viewModel: viewModel)
            case .none: Text("役職がみつかりません")
            }
        }
        
        .navigationDestination(isPresented: $viewModel.isAllFinished) {
            RoleCheckEndView(playerNames: viewModel.playerNames,viewModel: viewModel,path: $path)
        }
    }
}
