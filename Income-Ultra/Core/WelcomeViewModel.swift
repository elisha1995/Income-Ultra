//
//  WelcomeViewModel.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/7/25.
//

import Foundation
import Combine
import Factory

@MainActor
final class WelcomeViewModel: ObservableObject {
    
    @Injected(\.appInfoStore) var appInfoStore
    
    func getAppName() -> String {
        appInfoStore.name
    }
}
