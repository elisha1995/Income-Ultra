//
//  SettingsView.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/7/25.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @AppStorage(
        UserDefaultKeys.isDarkMode
    ) private var isDarkMode = true
    
    var body: some View {
        ScrollView {
            VStack(
                spacing: 16
            ) {
                introBoxView
                customizationBoxview
                applicationBoxView
                agreementBoxView
            }
            .padding()
        }
        .infinityFrame()
        .background(
            Color.appTheme.viewBackground
        )
    }
}

private extension SettingsView {
    var introBoxView: some View {
        IntroBoxView(
            data: .init(
                title: viewModel
                    .getAppName(),
                sfSymbol: "info.circle",
                imageName: "AppIconImage",
                description: viewModel
                    .getAppDescription()
            )
        )
    }
    
    var customizationBoxview: some View {
        BoxView(
            data: .init(
                title: "Customization",
                sfSymbol: "paintbrush"
            )
        ) {
            Toggle(
                "Dark Mode",
                isOn: $isDarkMode
            )
            .tint(
                .appTheme.accent
            )
        }
    }
    
    var applicationBoxView: some View {
        InfoBoxView(with: viewModel.applicationData)
    }
    
    var agreementBoxView: some View {
        InfoBoxView(with: viewModel.agreementsData)
    }
}

#Preview {
    SettingsView()
}
