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
    public var expenses: [Int]?

    public var balance: Int {
        guard let expenses = expenses, !expenses.isEmpty else {
            return budget
        }
        let totalExpenses = expenses.reduce(0) { total, num in total + num }
        
        return budget - totalExpenses
    }
}
