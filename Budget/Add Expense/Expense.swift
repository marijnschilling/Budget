//
// Created by Marijn Schilling on 15/10/2018.
// Copyright (c) 2018 Bakken & Bæck. All rights reserved.
//

import Foundation

enum Currency {
    case euro
    case dollar
}

struct Expense {
    let amount: Int
    let currency: Currency

    var amountInEuro: Int {
        return amount
    }

    init(amount: Int, currency: Currency = .euro) {
        self.amount = amount
        self.currency = currency
    }
}