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

    var dayBeforeDate: Date {
        var dateComponents = DateComponents()
        dateComponents.year = 2018
        dateComponents.month = 7
        dateComponents.day = 10

        return Calendar.current.date(from: dateComponents)!
    }

    var longAgoDate: Date {
        var dateComponents = DateComponents()
        dateComponents.year = 2018
        dateComponents.month = 2
        dateComponents.day = 12

        return Calendar.current.date(from: dateComponents)!
    }

    func testDayBudgetInitialization() {
        let dayBudget = DayBudget(budget: 20, date: someDate)

        XCTAssertEqual(dayBudget.budget, 20)
        XCTAssertEqual(DateFormatter.dayMonthYear.string(from: dayBudget.date), "11-07-18")
        XCTAssertEqual(dayBudget.balance, 20)
        XCTAssertEqual(dayBudget.expenses, [])
    }

    func testAddExpense() {
        let dayBudget = DayBudget(budget: 20, date: someDate)
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

    func testBudgetFromPreviousBudget() {
        let yesterdayBudget = DayBudget(budget: 20, date: dayBeforeDate)
        let dayBudget = DayBudget(fromPreviousBudget: yesterdayBudget, forDate: someDate)

        XCTAssertEqual(dayBudget.balance, 40)
    }

    func testBudgetFromPreviousBudgetWithExpenses() {
        let yesterdayBudget = DayBudget(budget: 20, date: dayBeforeDate)
        yesterdayBudget.addExpense(5)
        yesterdayBudget.addExpense(3)
        yesterdayBudget.addExpense(10)
        let dayBudget = DayBudget(fromPreviousBudget: yesterdayBudget, forDate: someDate)

        XCTAssertEqual(dayBudget.balance, 22)
    }

    func testBudgetFromLongAgoBudget() {
        let longAgoBudget = DayBudget(budget: 20, date: longAgoDate)
        let dayBudget = DayBudget(fromPreviousBudget: longAgoBudget, forDate: someDate)

        XCTAssertEqual(dayBudget.balance, 3000)
    }
}
