//
//  TitleViewModel.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//



import Foundation

// このクラスの処理はメインで実行してな！というおまじない。
@MainActor

// TitleViewModelというクラスを定義。ObservableObjectに準拠。Pablishedの変更を把握してくれる。
class TitleViewModel: ObservableObject {
// ゲームスタートするためのスイッチのフラグ。この値が変更されることで、画面遷移が起こる。
    @Published var isGameStarted = false
    // 画面遷移をするための関数。
    func startGame() {
        isGameStarted = true
    }
}
