//
//  RoleCheckStartView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

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
                    .font(.custom("PixelMplus12-Regular", size: 28))
                    .foregroundStyle(.white)
                    .frame(maxHeight: 450, alignment: .top)
                
                Text(viewModel.currentPlayerName)
                    .font(.custom("PixelMplus12-Regular", size: 32))
                    .foregroundStyle(.white)
                    .bold()
                    .padding(24)
                
                Button(action: {
                    SEManager.shared.playSE(named: "button_tap")
                    viewModel.isGoRoleCheck = true
                }) {
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
