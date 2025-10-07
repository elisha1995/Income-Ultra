//
//  HourlyOutput.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/7/25.
//

import Foundation

struct HourlyOutput {
    let takeHomePay: Pay
    let grossPay: Pay
    
    init(takeHomePay: Pay = .init(incomeType: .takeHome), grossPay: Pay = .init(incomeType: .gross)) {
        self.takeHomePay = takeHomePay
        self.grossPay = grossPay
    }
}
