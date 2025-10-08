//
//  IncomeLiveStore.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/7/25.
//

import Foundation

final class IncomeLiveStore: IncomeStore {
    func getSalaryOutput(for salaryInput: SalaryInput) -> SalaryOutput {
        calculateSalaryOutput(for: salaryInput)
    }
    func getHourlyOutput(for hourlyInput: HourlyInput) -> HourlyOutput {
        calculateHourlyOutput(for: hourlyInput)
    }
}

private extension IncomeLiveStore {
    func calculateSalaryOutput(for salaryInput: SalaryInput) -> SalaryOutput {
        guard let yearlyGrossPay = salaryInput.yearlyGross else {
            return .init()
        }
        
        let weeksInYear: Double = 52
        let monthsInYear: Double = 12
        let hoursPerWeek: Double = 40
        
        let weeklyGrossPay: Double = yearlyGrossPay / weeksInYear
        let biWeeklyGrossPay: Double = weeklyGrossPay * 2
        let fourWeeklyGrossPay: Double = weeklyGrossPay * 4
        let monthlyGrossPay: Double = yearlyGrossPay / monthsInYear
        
        let hourlyWage: Double = weeklyGrossPay / hoursPerWeek
        
        let takeHomePercentageDefault: Double = 83.00
        let takeHomePercentage: Double = salaryInput.takeHomePercentage ?? takeHomePercentageDefault
        let takeHomeMultiplier = takeHomePercentage / 100
        
        return .init(
            hourlyWage: hourlyWage,
            takeHomePay: .init(
                incomeType: .takeHome,
                weekly: weeklyGrossPay * takeHomeMultiplier,
                biWeekly: biWeeklyGrossPay * takeHomeMultiplier,
                fourWeekly: fourWeeklyGrossPay * takeHomeMultiplier,
                monthly: monthlyGrossPay * takeHomeMultiplier,
                yearly: yearlyGrossPay * takeHomeMultiplier
            ),
            grossPay: .init(
                incomeType: .gross,
                weekly: weeklyGrossPay,
                biWeekly: biWeeklyGrossPay,
                fourWeekly: fourWeeklyGrossPay,
                monthly: monthlyGrossPay,
                yearly: yearlyGrossPay
            )
        )
    }
    
    func calculateHourlyOutput(for hourlyInput: HourlyInput) -> HourlyOutput {
        guard let hourlyWage = hourlyInput.hourlyWage,
              let hoursPerWeek = hourlyInput.hoursPerWeek
        else {
            return .init()
        }
        
        let weeksInYear: Double = 52
        let monthsInYear: Double = 12
        let hoursPerWeekLimitForOvertime: Double = 40
        let overtimeRate: Double = 1.5
        
        let regularHours: Double = min(hoursPerWeek, hoursPerWeekLimitForOvertime)
        let overtimeHours: Double = max(0, hoursPerWeek - hoursPerWeekLimitForOvertime)
        let overtimeHourlyWage: Double = hourlyWage * overtimeRate
        let shouldCalculateOvertime: Bool = (overtimeHours > 0 && hourlyInput.overtime)
        
        let weeklyGrossPay: Double = shouldCalculateOvertime ? (regularHours * hourlyWage) + (overtimeHours * overtimeHourlyWage)
            : (hoursPerWeek * hourlyWage)
        
        let biWeeklyGrossPay: Double = weeklyGrossPay * 2
        let fourWeeklyGrossPay: Double = weeklyGrossPay * 4
        let yearlyGrossPay: Double = weeklyGrossPay * weeksInYear
        let monthlyGrossPay: Double = yearlyGrossPay / monthsInYear
        
        let takeHomePercentageDefault: Double = 83.00
        let takeHomePercentage: Double = hourlyInput.takeHomePercentage ?? takeHomePercentageDefault
        let takeHomeMultiplier = takeHomePercentage / 100
        
        return .init(
            takeHomePay: .init(
                incomeType: .takeHome,
                weekly: weeklyGrossPay * takeHomeMultiplier,
                biWeekly: biWeeklyGrossPay * takeHomeMultiplier,
                fourWeekly: fourWeeklyGrossPay * takeHomeMultiplier,
                monthly: monthlyGrossPay * takeHomeMultiplier,
                yearly: yearlyGrossPay * takeHomeMultiplier
            ),
            grossPay: .init(
                incomeType: .gross,
                weekly: weeklyGrossPay,
                biWeekly: biWeeklyGrossPay,
                fourWeekly: fourWeeklyGrossPay,
                monthly: monthlyGrossPay,
                yearly: yearlyGrossPay
            )
        )
    }
}
