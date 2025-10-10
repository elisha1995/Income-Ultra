//
//  Income_UltraApp.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/6/25.
//

import SwiftUI

@main
struct Income_UltraApp: App {
    @AppStorage(UserDefaultKeys.isDarkMode) private var isDarkMode: Bool = true
    
    var body: some Scene {
        WindowGroup {
            AppStartingView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
