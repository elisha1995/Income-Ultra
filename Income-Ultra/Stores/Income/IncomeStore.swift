//
//  IncomeStore.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/7/25.
//

import Foundation

protocol IncomeStore {
    func getSalaryOutput(for salaryInput: SalaryInput) -> SalaryOutput
    func getHourlyOutput(for hourlyInput: HourlyInput) -> HourlyOutput
}
