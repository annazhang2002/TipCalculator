//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Anna Zhang on 7/12/20.
//  Copyright © 2020 Anna Zhang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var splitNumControl: UITextField!
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tipControl.selectedSegmentIndex = defaults.integer(forKey:"tipIndex")
        splitNumControl.text = String(format: "%d", defaults.integer(forKey: "splitNum"))
    }
    @IBAction func setTipDefault(_ sender: Any) {
        defaults.set(tipControl.selectedSegmentIndex, forKey: "tipIndex")
        defaults.synchronize()
    }
    
    @IBAction func setSplitNum(_ sender: Any) {
        defaults.set(Int(splitNumControl.text!), forKey: "splitNum")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
