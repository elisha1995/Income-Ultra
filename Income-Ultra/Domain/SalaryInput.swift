//
//  SalaryInput.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/7/25.
//

import Foundation

struct SalaryInput {
    var yearlyGross: Double?
    var takeHomePercentage: Double?
    
    init(yearlyGross: Double? = nil, takeHomePercentage: Double? = nil) {
        self.yearlyGross = yearlyGross
        self.takeHomePercentage = takeHomePercentage
    }
}
