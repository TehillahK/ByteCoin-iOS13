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
    
    let coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.pickerView.dataSource = self
        
        self.pickerView.delegate = self
    }


}

extension ViewController: UIPickerViewDataSource{
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let numRows = coinManager.numCurrencies()
        return numRows
    }
    
    // number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
}


extension ViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return self.coinManager.getCurrency(index: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        let price = self.coinManager.getCoinPrice(for: row)
      //  print(selectedRow)
    }
  
    
}
