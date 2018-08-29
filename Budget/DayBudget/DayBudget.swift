//
//  DayBudget.swift
//  Budget
//
//  Created by Marijn Schilling on 22/08/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import Foundation

public class DayBudget {
    public static let budget = 20
    public let budget: Int
    public let date: Date

    private(set) var expenses = [Int]()
    private(set) var balance = DayBudget.budget

    public init(budget: Int, date: Date) {
        self.budget = budget
        self.balance = budget
        self.date = date
    }

    public init(fromPreviousBudget previousBudget: DayBudget, forDate date: Date = Date(), withBudget budget: Int = DayBudget.budget) {
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

    public func addExpense(_ expense: Int) {
        expenses.append(expense)
        balance -= expense
    }
}
