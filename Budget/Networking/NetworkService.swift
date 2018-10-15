//
// Created by Marijn Schilling on 15/10/2018.
// Copyright (c) 2018 Bakken & Bæck. All rights reserved.
//

import Foundation

class NetworkService {
    static let baseURL = "https://free.currencyconverterapi.com/api/v5"
    static let valueKey = "val"

    func getConversionRate(from initialCurrency: Currency, to targetCurrency: Currency, _ completion: @escaping (Float) -> ()) {
        let conversionComponent = initialCurrency.rawValue + "-" + targetCurrency.rawValue
        guard let url = createUrl(with: conversionComponent) else {
            //completion(error)
            return
        }

        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url) { data, _, error in

            guard let data = data else {
                // handle error
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                let currencyResult = json[conversionComponent] as? [String: Any],
                let conversionRate = currencyResult[NetworkService.valueKey] as? Float else {
                    // invalid response error
                    return
                }

                completion(conversionRate)

            } catch {
                // json decode error
            }
        }

        task.resume()
    }

    private func createUrl(with conversionComponent: String) -> URL? {
        return URL(string: NetworkService.baseURL + "convert?q=" + conversionComponent + "&compact=y")
    }
}
