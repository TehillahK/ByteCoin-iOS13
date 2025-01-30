//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.pickerView.dataSource = self
        
        self.pickerView.delegate = self
        
        self.coinManager.delegate = self
    }


}




// MARK: - Picker View

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
   // number of rows in column
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let numRows = coinManager.numCurrencies()
        return numRows
    }
    
    // number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return self.coinManager.getCurrency(index: row)
    }
    
    // do something when some thing is picked
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        print(row)
        
        self.coinManager.getCoinPrice(for: row)
        
       // self.currencyLabel.text = coinManager.getCurrency(index: row)
      //  print(selectedRow)
        
    }
  
    
}


// MARK: - update crypyto price

extension ViewController: CoinManagerDelegate{
    
    func didResponseUpdate(_ data: ResponseModel) {
        
        DispatchQueue.main.async {
            self.currencyLabel.text = String(data.asset_id_quote)
            self.valueLabel.text = String(format: "%.2f", data.rate)
        }
        
        
    }
    
    func didFailWithError(error: any Error) {
        print(error)
    }
    
    
}
