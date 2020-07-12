//
//  ViewController.swift
//  Tippy
//
//  Created by Anna Zhang on 7/12/20.
//  Copyright © 2020 Anna Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func calculateTip(_ sender: Any) {
        // get bill amount
        let bill = (Double) (billField.text!) ?? 0
        
        // calculate tip and total
        let tipPercentages = [0.1, 0.15, 0.2]
//        let
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill
        
        // update tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format:
            "$%.2f", total)
    }
    
    

}

