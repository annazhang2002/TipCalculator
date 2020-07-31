//
//  ViewController.swift
//  Tippy
//
//  Created by Anna Zhang on 7/12/20.
//  Copyright © 2020 Anna Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard
//    defaults.set(0.2, forKey:"tipPercent")
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipResultView: UIView!
    @IBOutlet weak var tipCapitaLabel: UILabel!
    
    @IBOutlet weak var splitNumLabel: UILabel!
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        billField.delegate = self
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tipControl.selectedSegmentIndex = defaults.integer(forKey:"tipIndex")
        if ((defaults.double(forKey: "billAmt")) != 0) {
            billField.text = String(format: "%.2f", (defaults.double(forKey: "billAmt")))
        }
        if (defaults.integer(forKey: "splitNum") != 0) {
            print(defaults.integer(forKey: "splitNum") )
            splitNumLabel.text = String.init(format: "x %d", defaults.integer(forKey: "splitNum"))
        } else {
            defaults.set(2, forKey: "splitNum")
        }
        calculateTip(self)
        billField.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animation(self)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // get bill amount
        let bill = (Double) (billField.text!) ?? 0
        defaults.set(bill, forKey: "billAmt")
        
        // calculate tip and total
        let tipPercentages = [0.1, 0.15, 0.2]
//        let
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill
        var splitCost = 0.0
        if defaults.integer(forKey: "splitNum") != 0 {
            splitCost = total / Double(defaults.integer(forKey: "splitNum"))
        }
        
        // update tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format:
            "$%.2f", total)
        tipCapitaLabel.text = String(format: "$%.2f", splitCost)
    }
    
    @IBAction func animation(_ sender: Any) {
        // Optionally initialize the property to a desired starting value
        billField.alpha = 0
        tipResultView.alpha = 0
        UIView.animate(withDuration:0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.billField.alpha = 1
            self.tipResultView.alpha = 1
        })
    }
    

}

