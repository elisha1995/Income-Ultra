//
//  WelcomeViewModel.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/7/25.
//

import Foundation
import Combine

@MainActor
final class WelcomeViewModel: ObservableObject {
    
    func getAppName() -> String {
        "Income Ultra"
    }
}
