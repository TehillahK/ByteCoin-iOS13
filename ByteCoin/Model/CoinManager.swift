//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
let env = ProcessInfo.processInfo.environment

struct CoinManager {
    
    let baseURL = "https://api-realtime.exrates.coinapi.io/v1/exchangerate/BTC"
    let apiKey =  env["API_KEY"]
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func numCurrencies()->Int{
        return currencyArray.count
    }
    
    func getCurrency(index: Int)-> String{
        return currencyArray[index]
    }
    
    func getCoinPrice(for index: Int)-> Double{
        let selectedCurrency = currencyArray[index]
        
        return 0.0
    }
}
