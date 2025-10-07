//
//  AppInfoLiveStore.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/7/25.
//

import Foundation

struct AppInfoLiveStore {
    let name: String = "Income Ultra"
    let description: String = "Income Ultra calculates your income from hourly rates or salary, including overtime, and provides detailed financial breakdowns."
    let developer: String = "Elisha Samuel Gyamfi"
    let website: String = "https://www.genssyioscode.com/projects/income-ultra"
    let agreements: Agreements = .init()
    
    var version: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return "-"
    }
    
    var compatibillity: String {
        if let minVersion = Bundle.main.infoDictionary?["MinimumOSVersion"] as? String {
            return "iOS \(minVersion)+"
        }
        return "-"
    }
}

extension AppInfoLiveStore {
    struct Agreements {
        let privacyPolicyUrl: String = "https://www.genssyioscode.com/projects/income-ultra"
        let termsAndConditionsUrl: String = "https://www.genssyioscode.com/projects/income-ultra"
        let copyrightPolicyUrl: String = "https://www.genssyioscode.com/projects/income-ultra"
        let disclaimerUrl: String = "https://www.genssyioscode.com/projects/income-ultra"
    }
}
