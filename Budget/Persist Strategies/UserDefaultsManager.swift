//
//  UserDefaultsManager.swift
//  Budget
//
//  Created by Marijn Schilling on 27/08/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import Foundation

class UserDefaultsManager: PersistDayBudgetStrategy {
    static let balanceKey = "BalanceKey"
    static let dateKey = "DateKey"

    let defaults = UserDefaults.standard

    func getDayBudget() -> DayBudget? {
        guard let balance = defaults.value(forKey: UserDefaultsManager.balanceKey) as? Int,
            let date = defaults.value(forKey: UserDefaultsManager.dateKey) as? Date else {
                return nil
        }

        return DayBudget(budget: balance, date: date)
    }

    func storeDayBudget(_ dayBudget: DayBudget) {
        defaults.set(dayBudget.balance, forKey: UserDefaultsManager.balanceKey)
        defaults.set(dayBudget.date, forKey: UserDefaultsManager.dateKey)
    }
}

