//
//  BudgetTests.swift
//  BudgetTests
//
//  Created by Marijn Schilling on 22/08/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import XCTest
@testable import Budget

class PersistentBalanceTests: XCTestCase {

    var yesterDate: Date {
        return Date().addingTimeInterval(-3600 * 24)
    }

    func testDayBudgetInitialization() {
        let budgetManager = DayBudgetManager(persistentManager: TestPersistantManger())

        let budget = budgetManager.budget
        XCTAssertNotNil(budget)
        XCTAssertEqual(budgetManager.dateString, DateFormatter.dayMonthYear.string(from: Date()))
    }

    func testDayBudgetPeristency() {
        let oldBudget = DayBudget(budget: 20, date: yesterDate)
        let budgetManager = DayBudgetManager(persistentManager: TestPersistantManger(oldBudget: oldBudget))

        XCTAssertEqual(budgetManager.dateString, DateFormatter.dayMonthYear.string(from: Date()))
        XCTAssertEqual(budgetManager.balance, 40)
        XCTAssertEqual(budgetManager.budget, 20)
    }

    func testDayBudgetPeristencyWithExpenses() {
        let oldBudget = DayBudget(budget: 20, date: yesterDate)
        let budgetManager = DayBudgetManager(persistentManager: TestPersistantManger(oldBudget: oldBudget))
        budgetManager.add(expense: Expense(amount: 10))

        XCTAssertEqual(budgetManager.dateString, DateFormatter.dayMonthYear.string(from: Date()))
        XCTAssertEqual(budgetManager.balance, 30)
        XCTAssertEqual(budgetManager.budget, 20)
    }
}
