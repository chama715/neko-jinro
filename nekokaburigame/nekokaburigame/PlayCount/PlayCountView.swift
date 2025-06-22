//
//  PlayCountView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import SwiftUI

struct PlayCountView: View {
    // NavigationStackのpathを親ビュー(ContentView)から受け取っている。
    @Binding var path: NavigationPath
    // PlayCountViewModelというインスタンスを生成。状態が変われば画面も変わるようになっている。
    @StateObject private var viewModel = PlayCountViewModel()
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            // スクロールできるようにしている。プレイヤー数とかが多い時に便利。
            ScrollView {
                VStack(spacing: 20) {
                    Text("プレイヤーの数を選んでください。")
                    
                    // 3~10人の中で好きな数字を選べるステッパー。プレイヤー数を選択する。ここの値は、ViewModelのplayCountに反映される。
                    Stepper(value: $viewModel.playerCount, in: 3...10) {

                        // プレイヤー数を表示。
                        Text("\(viewModel.playerCount)人")
                            .font(.title)
                            .foregroundColor(.black)
                    }

                    // .onChange(of:)of:~~の値に変化があった時、何かしらの処理を行うやつ。playCountの値が変わったら、viewModel.adjustPlayerNameArray()を実行。
                    // プレイヤー数が変わったら、その文配列も増やす。
                    .onChange(of: viewModel.playerCount) { _, _ in
                        DispatchQueue.main.async {
                            viewModel.adjustPlayerNameArray()
                        }
                    }
                    

                    LazyVStack(spacing: 10) {
                        // プレイヤーの数分繰り返してテキスト入力欄を表示させる。
                        ForEach(0..<viewModel.playerCount, id: \.self) { index in
                            if index < viewModel.playerName.count {
                                // 薄文字でプレイヤー1とかを表示。getは表示。setは保存。
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
            // isGameReadyActiveがtrueになると、GameReadyViewに画面遷移。
            .navigationDestination(isPresented: $viewModel.isGameReadyActive) {
                GameReadyView(playerNames: viewModel.playerName,path: $path)
            }
            
            // ボタンを押したら、startGame()が実行される。つまり画面遷移。
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
