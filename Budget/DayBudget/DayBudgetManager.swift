//
//  DayBudgetManager.swift
//  Budget
//
//  Created by Marijn Schilling on 23/08/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import UIKit

final class DayBudgetManager {
    public var persistentManager: PersistDayBudgetStrategy

    private var dayBudget: DayBudget

    init(persistentManager: PersistDayBudgetStrategy) {
        self.persistentManager = persistentManager
        if let dayBudget = persistentManager.getDayBudget() {
            self.dayBudget = dayBudget
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

    public func budget() -> Int {
        return dayBudget.budget
    }

    public func balance() -> Int  {
        return dayBudget.balance
    }

    public func date() -> Date  {
        return dayBudget.date
    }

    public func addExpense(_ expense: Int) {
        dayBudget.addExpense(expense)
        persistentManager.storeDayBudget(dayBudget)
    }
}

protocol PersistDayBudgetStrategy {
    func getDayBudget() -> DayBudget?
    func storeDayBudget(_ dayBudget: DayBudget)
}

class UserDefaultsManager: PersistDayBudgetStrategy {
    static let balanceKey = "BalanceKey"
    static let dateKey = "DateKey"

    let defaults = UserDefaults.standard

    func getDayBudget() -> DayBudget? {
        guard let balance = defaults.value(forKey: UserDefaultsManager.balanceKey) as? Int,
                let date = defaults.value(forKey: UserDefaultsManager.dateKey) as? Date else {
                return nil
        }

        return DayBudget(fromPreviousBudget: DayBudget(budget: balance, date: date))
    }

    func storeDayBudget(_ dayBudget: DayBudget) {
        defaults.set(dayBudget.balance, forKey: UserDefaultsManager.balanceKey)
        defaults.set(dayBudget.date, forKey: UserDefaultsManager.dateKey)
    }
}
