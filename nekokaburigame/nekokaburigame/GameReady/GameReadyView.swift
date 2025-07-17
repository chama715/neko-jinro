//
//  GameReady.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import SwiftUI

struct GameReadyView: View {
    let playerNames: [String]
    @StateObject private var viewModel = GameReadyViewModel()
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("夜がきました。\n各自役職を確認し\n夜のアクションを行ってください。")
                    .font(.custom("PixelMplus12-Regular", size: 24))
                    .padding()
                
                Button(action: {
                    SEManager.shared.playSE(named: "button_tap")
                    viewModel.startGame(with: playerNames)
                }) {
                    Text("OK")
                        .font(.custom("PixelMplus12-Regular", size: 28))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
            .navigationDestination(isPresented: $viewModel.isGameReady) {
                RoleCheckStartView(path: $path,viewModel: viewModel.rolechekStartviewModel)
            }
            
            .navigationDestination(isPresented: $viewModel.goToVotePhase) {
                VoteView(playerNames: playerNames,assignedRoles: Array(viewModel.assignedRoles),path: $path)
            }
        }
    }
}
