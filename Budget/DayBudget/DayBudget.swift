//
//  DayBudget.swift
//  Budget
//
//  Created by Marijn Schilling on 22/08/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import Foundation

class DayBudget {
    static let budget = 20
    let budget: Int
    let date: Date

    private(set) var expenses = [Int]()
    private(set) var balance = DayBudget.budget

    init(budget: Int, date: Date) {
        self.budget = budget
        self.balance = budget
        self.date = date
    }

    init(fromPreviousBudget previousBudget: DayBudget, forDate date: Date = Date(), withBudget budget: Int = DayBudget.budget) {
        let calendar = NSCalendar.current

        let previousDate = calendar.startOfDay(for: previousBudget.date)
        let newDate = calendar.startOfDay(for: date)

        let components = calendar.dateComponents([.day], from: previousDate, to: newDate)

        var balance = previousBudget.balance
        if let numberOfDaysDifference = components.day {
            balance += (DayBudget.budget * numberOfDaysDifference)
        }

        self.balance = balance
        self.date = date
        self.budget = budget
    }

    func addExpense(_ expense: Expense) {
        expenses.append(expense.amountInEuro)
        balance -= expense.amountInEuro
    }
}
