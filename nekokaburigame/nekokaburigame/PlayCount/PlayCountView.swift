//
//  PlayCountView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

/*
 2画面目。その名の通り、プレイヤーの人数と名前を決める画面。
 プレイヤー数を決める状態、画面遷移するためのフラグは裏のViewModelにあって、ObservableObjectになっているのでこっちにも反映される。
 ステッパーを使ってプレイヤー数を決めて、ここで決めた人数はPlayCountとして保存される。
 .onChange(of:)のところは、配列を調整してくれる関数を呼び出す仕組みになっている。playerCountの値が変わったらadjustPlayerNameArray()を呼び出して安全に処理をしてくれる。
 そして人数分の入力欄を作り、その内容を保存。プレイヤーの名前はここで決まる！
 */

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
                        .font(.title2)
                        .bold()
                        .padding(.top)
                    
                    Stepper(value: $viewModel.playerCount, in: 5...10) {
                        Text("\(viewModel.playerCount)人")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .frame(maxWidth: 400)
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
                                .padding(.horizontal)
                            }
                        }
                    }
                    .frame(maxWidth: 400)
                    .padding(.bottom, 20)

                    Button(action: {
                        SEManager.shared.playSE(named: "button_tap")
                        viewModel.startGame()
                    }) {
                        Text("START")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }
                }
                .padding()
            }
            .navigationDestination(isPresented: $viewModel.isGameReadyActive) {
                GameReadyView(playerNames: viewModel.playerName, path: $path)
            }
        }
    }
}

#Preview {
    NavigationStack {
        PlayCountView(path: .constant(NavigationPath()))
    }
}
