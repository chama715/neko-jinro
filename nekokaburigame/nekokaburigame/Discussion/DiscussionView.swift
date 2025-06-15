//
//  DiscussionView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/15.
//

import SwiftUI

struct DiscussionView: View {
    @StateObject private var viewModel = DiscussionViewModel()

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 40) {
                Text(viewModel.timeString)
                    .font(.system(size: 60, weight: .bold, design: .monospaced))
                    .padding()

                HStack(spacing: 30) {
                    Button(action: { viewModel.adjustTime(by: -60) }) {
                        Image(systemName: "minus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    }

                    Button(action: {
                        viewModel.isTimerActive ? viewModel.stopTimer() : viewModel.startTimer()
                    }) {
                        Image(systemName: viewModel.isTimerActive ? "pause.circle.fill" : "play.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }

                    Button(action: { viewModel.adjustTime(by: 60) }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.green)
                    }
                }

                Button(action: {
                    viewModel.stopTimer()
                }) {
                    Text("話し合いを終了")
                        .font(.title2)
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

#Preview {
    DiscussionView()
}
