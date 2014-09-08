//
//  ViewController.swift
//  TipCalculator
//
//  Created by Lew on 8/30/14.
//  Copyright (c) 2014 Lew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //Creating IBOutlets to connect up my UI with my code.
    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView :UITextView!
    
    
    //Connecting Outlets to a functions that need to be run.
    @IBAction func calculateTapped(sender :AnyObject) {
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        let possibleTips = tipCalc.returnPossibleTips()
        var results = " "
        for (tipPct, tipValue) in possibleTips {
            results += "\(tipPct)%: \(tipValue)\n"
        }
        resultsTextView.text = results
        
    }
    
    
    
    @IBAction func taxPercentageChanged(sender :AnyObject) {
        
    }
    
    
    @IBAction func viewTapped(sender : AnyObject) {
    
    }

    
    
    
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    
    func refreshUI () {
    totalTextField.text = String(format: "%0.2f", tipCalc.total)
    taxPctSlider.value = Float(tipCalc.taxPct)*100
    taxPctLabel.text = "Tax percent(\(Int(taxPctSlider.value))%)"
    resultsTextView.text = " "
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
         func taxPercentageChanged(sender : AnyObject) {
            tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
            refreshUI()
        }
         func viewTapped(sender : AnyObject) {
            totalTextField.resignFirstResponder()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

