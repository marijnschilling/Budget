//
//  BudgetTests.swift
//  BudgetTests
//
//  Created by Marijn Schilling on 22/08/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import XCTest
@testable import Budget

class DayBudgetTests: XCTestCase {

    var someDate: Date {
        var dateComponents = DateComponents()
        dateComponents.year = 2018
        dateComponents.month = 7
        dateComponents.day = 11

        return Calendar.current.date(from: dateComponents)!
    }

    func testDayBudgetInitialization() {
        let dayBudget = DayBudget(budget: 20, date: someDate)

        XCTAssertEqual(dayBudget.budget, 20)
        XCTAssertEqual(dayBudget.dateFormat.string(from: dayBudget.date), "11-07-18")
        XCTAssertEqual(dayBudget.balance, 20)
        XCTAssertNil(dayBudget.expenses)
    }

    func testAddExpense() {
        var dayBudget = DayBudget(budget: 20, date: someDate)
        dayBudget.addExpense(5)
        XCTAssertEqual(dayBudget.balance, 15)
        dayBudget.addExpense(1)
        dayBudget.addExpense(3)
        XCTAssertEqual(dayBudget.balance, 11)
        dayBudget.addExpense(5)
        dayBudget.addExpense(5)
        dayBudget.addExpense(5)
        XCTAssertEqual(dayBudget.balance, -4)
        dayBudget.addExpense(-5)
        dayBudget.addExpense(-5)
        XCTAssertEqual(dayBudget.balance, 6)
    }
}
