//
//  ContentView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/06.
//

// TitleViewが1番最初にくるように。そしてNavigationStackをここで定義しておくことで、他のファイルで画面遷移に使える。

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TitleView()
        }
    }
}
