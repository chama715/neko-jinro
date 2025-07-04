# 猫人狼アプリ
## 概要
1つの端末を用いて遊べるオフラインのゲームです。
ランダムに配布される役職を元に皆さんで話し合い、誰が人間なのか、誰が猫なのかを探し当て勝敗を決めます。
## 使用技術
- SwiftUI
- MVVM
- UserDefaults
## 機能
- プレイヤー人数設定
- 役職ランダム配布
- 話し合いタイマー
- 投票機能
- 結果発表
- BGM、SE
- 画面遷移
## 工夫ポイント
- NavigationStackとNavigationPathで柔軟な画面遷移
- ViewとViewModelを分離し、見やすく
- AudioPlayerを使用してBGMやSEを追加
## 苦労ポイント
- 泥棒猫による役職入れ替え後、正しく表示を切り替えるロジックの実装
- 画面数が多くファイルの管理が大変だったこと
- NavigationPathを使用した戻る処理でバグが出たが、パスのリセットと条件分岐で解決した
## ビルド方法
- Xcode 16.0以降
- このリポジトリをcloneし、`nekokaburigame.xcodeproj` を開いてビルド
## 作者
Naoto Takahashi
