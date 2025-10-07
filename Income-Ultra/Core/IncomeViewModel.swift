//
//  IncomeViewModel.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/7/25.
//

import Foundation
import Observation
import Combine
import Factory

@MainActor
final class IncomeViewModel: ObservableObject {
    @Published var incomePickerValue: IncomePickerView.IncomeType = .salary
    
    @Injected(\.incomeStore) private var incomeStore
    @Injected(\.appInfoStore) private var appInfoStore
    
    var appName: String {
        appInfoStore.name
    }
}
