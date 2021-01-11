//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class TipVC: UIViewController {
    
    @IBOutlet weak var billTextFiekd: UITextField!
    
    @IBOutlet weak var zeroPctBtn: UIButton!
    @IBOutlet weak var tenPctBtn: UIButton!
    @IBOutlet weak var twentyPctBtn: UIButton!
    @IBOutlet weak var splitNumberBtn: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {

        billTextFiekd.endEditing(true)
        zeroPctBtn.isSelected = false
        tenPctBtn.isSelected = false
        twentyPctBtn.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleMinusSign)!
        tip = buttonTitleAsNumber/100
    
    }
    
    @IBAction func steperValueChanged(_ sender: UIStepper) {
        
        splitNumberBtn.text = String(format: "%.0f", sender.value)
        
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatedPresed(_ sender: UIButton) {
        
        let bill = billTextFiekd.text!
        
        if bill != "" {
            
            billTotal = Double(bill)!
            
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            
            finalResult = String(format: "%.2f", result)

        }
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip*100)
            destinationVC.split = numberOfPeople
            
            
        }
    }
    
    
}

