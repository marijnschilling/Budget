//
//  DayBudgetManager.swift
//  Budget
//
//  Created by Marijn Schilling on 23/08/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import UIKit

final class DayBudgetManager {
    var persistentManager: PersistDayBudgetStrategy

    private var dayBudget: DayBudget

    init(persistentManager: PersistDayBudgetStrategy) {
        self.persistentManager = persistentManager
        if let dayBudget = persistentManager.getDayBudget() {
            self.dayBudget = DayBudget(fromPreviousBudget: dayBudget)
        } else {
            self.dayBudget = DayBudget(budget: DayBudget.budget, date: Date())
            persistentManager.storeDayBudget(self.dayBudget)
        }
    }

    private func setDayBudget() -> DayBudget {
        guard let dayBudget = persistentManager.getDayBudget() else {
            let dayBudget = DayBudget(budget: DayBudget.budget, date: Date())
            persistentManager.storeDayBudget(dayBudget)

            return dayBudget

        }

        return dayBudget
    }

    var budget: Int {
        return dayBudget.budget
    }

    var balance: Int  {
        return dayBudget.balance
    }

    var date: Date {
        return dayBudget.date
    }

    var dateString: String  {
        return DateFormatter.dayMonthYear.string(from: dayBudget.date)
    }

    func add(expense: Expense) {
        dayBudget.addExpense(expense)
        persistentManager.storeDayBudget(dayBudget)
    }
}
