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

    var someDate: Date {
        var dateComponents = DateComponents()
        dateComponents.year = 2018
        dateComponents.month = 7
        dateComponents.day = 11

        return Calendar.current.date(from: dateComponents)!
    }

    func testDayBudgetInitialization() {
        
    }
}
