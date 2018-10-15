//
// Created by Marijn Schilling on 15/10/2018.
// Copyright (c) 2018 Bakken & Bæck. All rights reserved.
//

import XCTest
@testable import Budget

class ExpenseTests: XCTestCase {
    func testExpenseConversion() {
        let expense = Expense(amount: 15, currency: .dollar)

        XCTAssertEqual(expense.amount, 15)
        XCTAssertEqual(expense.amountInEuro, 15)
    }
}