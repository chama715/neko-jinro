//
//  TitleViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

// TitleViewの裏方さん。

import Foundation

// メインで動かすぜ、という合図
@MainActor
// TitleViewModelというクラスを定義。ObservableObjectで画面の状態を外から監視できる。
class TitleViewModel: ObservableObject {
    // isGamestartedの状態が変わったら画面に通知がいく。falseにしておいて、trueになったら画面が変わる。
    @Published var isGameStarted = false
    
    // isGamestartedの値をtrueにする関数
    func startGame() {
        isGameStarted = true
    }
}
