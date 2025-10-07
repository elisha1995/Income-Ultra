//
//  HourlyInput.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/7/25.
//

import Foundation

struct HourlyInput {
    var hourlyWage: Double?
    var hoursPerWeek: Double?
    var takeHomePercentage: Double?
    var overtime: Bool
    
    init(hourlyWage: Double? = nil, hoursPerWeek: Double? = nil, takeHomePercentage: Double? = nil, overtime: Bool) {
        self.hourlyWage = hourlyWage
        self.hoursPerWeek = hoursPerWeek
        self.takeHomePercentage = takeHomePercentage
        self.overtime = overtime
    }
    
    let hoursPerWeekLimitForOvertime: Double = 40
}
