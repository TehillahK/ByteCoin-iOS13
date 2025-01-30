//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
let env = ProcessInfo.processInfo.environment

protocol CoinManagerDelegate{
    func didResponseUpdate(_ data:ResponseModel)
    func didFailWithError(error:Error)
    
}

struct CoinManager {
    
    let baseURL = "https://api-realtime.exrates.coinapi.io/v1/exchangerate/BTC"
    let apiKey =  env["API_KEY"]
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?

    
    func numCurrencies()->Int{
        return currencyArray.count
    }
    
    
    func getCurrency(index: Int)-> String{
        return currencyArray[index]
    }
    
    
    func getCoinPrice(for index: Int){
        
        print("get coin price")
    
        makeApiRequest(currencyIndex: index)
        
    }
    
    
    func makeApiRequest(currencyIndex: Int){
        
        let session = URLSession(configuration:.default)
        
        let urlString = baseURL + "/\(currencyArray[currencyIndex])?apiKey=\(apiKey!)"
         
            if let url = URL(string:urlString){
               let task = session.dataTask(with: url, completionHandler: {
                    (data, response, error) in
                    if (error != nil){
                        print("failed to fetch")
                        self.delegate?.didFailWithError(error: error!)
                        return
                    }else{
                        if let safeData = data{
                            let result = parseJSON(safeData)
                            if let safeResult = result{
                                print(safeResult.asset_id_quote)
                                // its probably safe
                                self.delegate?.didResponseUpdate(safeResult)
                            }
                            
                         
                        }
                    }
                    
                })
                
                // runs request
                task.resume()
            
            }
        
    }
    
    
    
    func parseJSON(_ data: Data)-> ResponseModel?{
        let decoder = JSONDecoder()
                do{
                    let decodedData = try decoder.decode(ResponseModel.self, from: data)
                   // print("temp\(decodedData.main.temp)")
                    print(decodedData.rate)
                    return decodedData
                    
                }catch{
                    print("PARSE Error:\(error)")
                    self.delegate?.didFailWithError(error:error )
                    return nil
                }
        
    }
}
