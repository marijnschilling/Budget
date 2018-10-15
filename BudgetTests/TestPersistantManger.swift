//
//  TestPersistanceStrategy.swift
//  BudgetTests
//
//  Created by Marijn Schilling on 24/08/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import Foundation
@testable import Budget

class TestPersistantManger: PersistDayBudgetStrategy {
    var budget: DayBudget?

    init(oldBudget: DayBudget? = nil) {
        self.budget = oldBudget
    }
    
    func getDayBudget() -> DayBudget? {
        return budget
    }

    func storeDayBudget(_ dayBudget: DayBudget) {
        self.budget = dayBudget
    }
}
