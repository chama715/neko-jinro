//
//  LastPageView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/19.
//

import SwiftUI

struct LastPageView: View {
    @ObservedObject var viewModel: LastPageViewModel
    @Binding var path: NavigationPath

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Text("結果発表")
                    .font(.largeTitle)
                    .bold()
                    .underline()
                    .padding(.top)

                Text(viewModel.winnerText)
                    .font(.title)
                    .foregroundColor(.red)
                    .padding(.bottom, 20)

                ForEach(viewModel.playerResults, id: \.name) { name, role, result in
                    HStack {
                        Text(name)
                            .bold()

                        Text(role.displayName)

                        Text(result)
                            .foregroundColor(result == "勝ち！" ? .green : .red)
                            .underline()
                    }
                    .font(.title3)
                    .padding(.horizontal, 32)
                }

                Spacer().frame(height: 30)

                Button("タイトルに戻る") {
                    path = NavigationPath()
                    path.append(Route.title)
                }
                .font(.title2)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
            .padding()
        }
    }
}
