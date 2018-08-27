//
//  PersistDayBudgetStrategy.swift
//  Budget
//
//  Created by Marijn Schilling on 27/08/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import Foundation

protocol PersistDayBudgetStrategy {
    func getDayBudget() -> DayBudget?
    func storeDayBudget(_ dayBudget: DayBudget)
}
