//
// Created by Marijn Schilling on 15/10/2018.
// Copyright (c) 2018 Bakken & Bæck. All rights reserved.
//

import Foundation

protocol CurrencyServiceStrategy {
    var baseCurrency: Currency { get set}

    func convert(_ amount: Int, from currency: Currency, completion: (Int) -> ())
}