//
//  RuleView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/07/03.
//

import SwiftUI

struct RuleView: View {
    @Binding var path: NavigationPath

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("🐾 猫人狼\nルール説明")
                    .font(.largeTitle)
                    .bold()
                    .underline()
                    .padding(.bottom, 10)

                Text("【ゲーム概要】\nプレイヤーに役職をランダムに割り当て、人間チームと猫チームに分かれて戦います。話し合いと投票を通じて、相手チームを処刑し勝利を目指しましょう。")

                Text("【役職】\n・人間：猫チームを見つけ出し、処刑されないようにする。\n・野良猫：通常の猫メンバー。\n・泥棒猫：夜に他のプレイヤーと役職を入れ替えることができる。\n・ボス猫：夜に他のプレイヤーの役職を1人だけ確認できる。")

                Text("【勝利条件】\n・人間チームの勝利：猫チームの誰かが処刑されること。\n・猫チームの勝利：人間チームの誰かが処刑されること。")

                Text("【操作方法】\n1. タイトル画面で『GAME START』を押す\n2. プレイヤー人数・名前を設定\n3. 夜に役職を確認し、必要なアクションを行う\n4. 話し合い後に投票し処刑するプレイヤーを決定\n5. 処刑結果を確認し、勝敗を確認")

                Spacer().frame(height: 30)

                Button(action: {
                    SEManager.shared.playSE(named: "button_tap")
                    path = NavigationPath()
                    path.append(Route.title)
                }) {
                    Text("タイトルに戻る")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding()
        }
        .background(
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}
