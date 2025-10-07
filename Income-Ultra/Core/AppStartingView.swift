//
//  ContentView.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/6/25.
//

import SwiftUI

struct AppStartingView: View {
    @StateObject private var viewModel = AppStartingViewModel()
    
    var body: some View {
        Group {
            if viewModel.shouldShowWelcomeView {
                WelcomeView(shouldShowWelcomeView: $viewModel.shouldShowWelcomeView)
            } else {
                HomeTabView()
            }
        }
        .animation(.easeIn, value: viewModel.shouldShowWelcomeView)
    }
}

#Preview {
    AppStartingView()
}
