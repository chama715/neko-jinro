//
//  AnnouncementView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/18.
//

import SwiftUI

struct AnnouncementView: View {
    let executedPlayerName: String
    let playerNames: [String]
    let assignedRoles: [Role]
    let originalRoles: [Role]
    @ObservedObject var viewModel: AnnouncementViewModel
    @State private var isGoToLastPage = false
    @Binding var path: NavigationPath

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("投票の結果、以下のプレイヤーが\n処刑されることになりました。")
                    .font(.custom("PixelMplus12-Regular", size: 24))
                    .bold()
                    .padding()

                Text(executedPlayerName)
                    .font(.custom("PixelMplus12-Regular", size: 28))
                    .bold()
                    .padding()
                    .underline()

                Button(action: {
                    SEManager.shared.playSE(named: "button_tap")
                    isGoToLastPage = true
                }) {
                    Text("結果発表")
                        .font(.custom("PixelMplus12-Regular", size: 24))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
        }
        .navigationDestination(isPresented: $isGoToLastPage) {
            LastPageView(viewModel: LastPageViewModel(playerNames: playerNames,assignedRoles: assignedRoles,originalRoles: originalRoles,executedPlayerName: executedPlayerName),path: $path
            )
        }
    }
}

