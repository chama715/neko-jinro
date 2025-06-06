//
//  TitleViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

import Foundation

// メインで動かすぜ、という合図
@MainActor
// TitleViewModelというクラスを定義。
class TitleViewModel: ObservableObject {
    // isGamestartedの状態が変わったら画面に通知がいく。falseにしておいて、trueになったら画面が変わる。
    @Published var isGameStarted = false
    
    // isGamestartedの値をtrueにする関数
    func startGame() {
        isGameStarted = true
    }
}
