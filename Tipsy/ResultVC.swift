//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Bagus setiawan on 09/10/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingLabel.text = "split betwen \(split) people, with \(tip) % tip"
    }
    
    
    @IBAction func recalculatePressBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
