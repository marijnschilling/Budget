//
// Created by Marijn Schilling on 15/10/2018.
// Copyright (c) 2018 Bakken & Bæck. All rights reserved.
//

import Foundation

class CurrencyService: CurrencyServiceStrategy {
    var baseCurrency: Currency = .euro

    func convert(_ amount: Int, from currency: Currency, completion: (Int) -> ()) {
        guard currency != baseCurrency else {
            completion(amount)
            return
        }

        // Go to NetworkService 
    }
}
