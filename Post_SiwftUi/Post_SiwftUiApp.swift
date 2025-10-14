//
//  Post_SiwftUiApp.swift
//  Post_SiwftUi
//
//  Created by Koushik Reddy Kambham on 10/14/25.
//

import SwiftUI

@main
struct Post_SiwftUiApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = PostNewsModel(networkObj: NetworkManager.shared)
            
            ContentView(postViewModel: viewModel)
        }
    }
}
