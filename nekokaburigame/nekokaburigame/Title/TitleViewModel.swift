//
//  TitleViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

/*
 itleViewModelというクラスを定義し、ObservableObjectに準拠していることで、Publishedなどの値の変更をviewに反映させることができる。
 isGameStartedの値がtrueになる関数を実行(ボタンを押す)し、画面遷移する仕組み。
 */

import Foundation

@MainActor

class TitleViewModel: ObservableObject {

    @Published var isGameStarted = false

    func startGame() {
        isGameStarted = true
    }
}
