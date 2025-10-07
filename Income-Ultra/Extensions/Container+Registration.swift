//
//  Container+Registration.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/7/25.
//

import Factory

extension Container {
    var appInfoStore: Factory<AppInfoLiveStore> {
        self { MainActor.assumeIsolated { AppInfoLiveStore() } }.singleton
    }
    
    var incomeStore: Factory<IncomeStore> {
        self { MainActor.assumeIsolated { IncomeLiveStore() } }.singleton
    }
}
