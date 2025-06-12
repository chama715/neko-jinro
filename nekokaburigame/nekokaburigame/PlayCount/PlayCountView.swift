//
//  PlayCountView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//



import SwiftUI

struct PlayCountView: View {
    
    @StateObject private var viewModel = PlayCountViewModel()
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            // 縦方向のスクロールを可能にしている。
            ScrollView {
                VStack(spacing: 20) {
                    Text("プレイヤーの数を選んでください。")
                    
                    // viewModelのplayerCountとバインディングをしていて、3〜10の人数を+と-で管理できる。
                    Stepper(value: $viewModel.playerCount, in: 3...10) {
                        // 上記で設定した人数を人という単位つきで表示する。
                        Text("\(viewModel.playerCount)人")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    // プレイヤー数が変更されたら、名前の数も調整する。クラッシュしたから非同期処理にした。DispatchQueue.main.asyncで、全ての処理が終わるまで待つ。というやつ。
                    .onChange(of: viewModel.playerCount) { _, _ in
                        DispatchQueue.main.async {
                            viewModel.adjustPlayerNameArray()
                        }
                    }
                    
                    // FoEachなど、数多くのリストなどを表示する時はLazyの方を使う。
                    LazyVStack(spacing: 10) {
                        // 繰り返しの処理。
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
            // 画面遷移。playerNameを渡す。
            .navigationDestination(isPresented: $viewModel.isGameReadyActive) {
                GameReadyView(playerNames: viewModel.playerName)
            }
            
            // startGameを実行→isGameReadyActiveがtrue
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

#Preview {
    PlayCountView()
}

