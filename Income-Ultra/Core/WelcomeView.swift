//
//  WelcomeView.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/7/25.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var shouldShowWelcomeView: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to Income Ultra")
                
            Button {
                shouldShowWelcomeView = false
            } label: {
                Text("Get Started")
            }
        }
    }
}

#Preview {
    WelcomeView(shouldShowWelcomeView: .constant(true))
}
