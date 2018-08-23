//
//  DayBudget.swift
//  Budget
//
//  Created by Marijn Schilling on 22/08/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import Foundation

public struct DayBudget {
    public let budget: Int
    public let date: Date
    private(set) var expenses = [Int]()

    public mutating func addExpense(_ expense: Int) {
        expenses.append(expense)
    }

    public var dateFormat: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yy"

        return dateFormatter
    }

    public var balance: Int {
        guard !expenses.isEmpty else {
            return budget
        }
        let totalExpenses = expenses.reduce(0) { total, num in total + num }
        
        return budget - totalExpenses
    }

    public init(budget: Int, date: Date) {
        self.budget = budget
        self.date = date
    }
}
