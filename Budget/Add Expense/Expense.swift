//
//  Expense.swift
//  Budget
//
//  Created by Marijn Schilling on 08/11/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import Foundation

struct Expense {
    let amount: Int
    let description: String?
    let date: Date

    init(withAmount amount: Int, description: String?, date: Date = Date()) {
        self.amount = amount
        self.description = description
        self.date = date
    }
}
