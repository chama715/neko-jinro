//
//  PlayCountView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import SwiftUI

struct PlayCountView: View {
    @Binding var path: NavigationPath
    @StateObject private var viewModel = PlayCountViewModel()
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    Text("プレイヤーの数を選んでください。")
                    
                    Stepper(value: $viewModel.playerCount, in: 3...10) {

                        Text("\(viewModel.playerCount)人")
                            .font(.title)
                            .foregroundColor(.black)
                    }

                    .onChange(of: viewModel.playerCount) { _, _ in
                        DispatchQueue.main.async {
                            viewModel.adjustPlayerNameArray()
                        }
                    }
                    

                    LazyVStack(spacing: 10) {

                        ForEach(0..<viewModel.playerCount, id: \.self) { index in
                            if index < viewModel.playerName.count {
                                TextField("プレイヤー\(index + 1)", text: Binding(
                                    get: { viewModel.playerName[index] },
                                    set: { viewModel.playerName[index] = $0 }
                                ))
                                .textFieldStyle(.roundedBorder)
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    .frame(height: 250)
                    .frame(width: 350)
                }
            }

            .navigationDestination(isPresented: $viewModel.isGameReadyActive) {
                GameReadyView(
                    playerNames: viewModel.playerName,
                    path: $path
                )
            }

            

            Button(action: {
                viewModel.startGame()
            }) {
                Text("START")
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
