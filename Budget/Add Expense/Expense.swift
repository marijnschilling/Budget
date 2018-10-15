//
// Created by Marijn Schilling on 15/10/2018.
// Copyright (c) 2018 Bakken & Bæck. All rights reserved.
//

import Foundation

struct Expense {
    private let amount: Int
    private let currency: Currency

    var currencyService: CurrencyServiceStrategy

    var amountInEuro: Int {
        return amount
    }

    init(amount: Int, currency: Currency = .euro, currencyService: CurrencyServiceStrategy = CurrencyService()) {
        self.amount = amount
        self.currency = currency
        self.currencyService = currencyService
    }

    func amountInEuro(_ completion: @escaping (Int) -> ()) {
        currencyService.convert(amount, from: currency, completion: completion)
    }
}
