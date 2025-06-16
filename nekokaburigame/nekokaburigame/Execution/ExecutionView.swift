//
//  ExecutionView.swift
//  nekokaburigame
//
//  Created by 高橋直斗 on 2025/06/16.
//

import SwiftUI

struct ExecutionView: View {
    @StateObject private var viewModel = ExecutionViewModel()
    
    var body: some View {
        Text("処刑")
    }
}

#Preview {
    ExecutionView()
}
