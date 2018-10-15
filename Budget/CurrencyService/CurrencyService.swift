//
// Created by Marijn Schilling on 15/10/2018.
// Copyright (c) 2018 Bakken & Bæck. All rights reserved.
//

import Foundation

class CurrencyService: CurrencyServiceStrategy {
    var baseCurrency: Currency = .euro
    let networkService: NetworkService

    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }


    func convert(_ amount: Int, from currency: Currency, completion: @escaping (Int) -> ()) {
        guard currency != baseCurrency else {
            completion(amount)
            return
        }

        networkService.getConversionRate(from: currency, to: baseCurrency) { conversion in

        }
    }
}
