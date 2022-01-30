//
//  ViewController.swift
//  Tipsy
//
//  Created by Сергей on 24.01.2022.
//  Copyright © 2022 STDevelopment. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!{
        didSet {
            let defaultTextColor = NSAttributedString(
                string: "e.g. 123.56",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGreen])
            
            billTextField.attributedPlaceholder = defaultTextColor
        }
    }
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var numberOfPeople = 2
    var billTotal = 0.0
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        updButtons()
        billTextField.endEditing(true)
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let titleFormating = String(buttonTitle.dropLast())
        let titleToNumber = Double(titleFormating)!
        tip = titleToNumber / 100
        
    }
    func updButtons(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
        numberOfPeople = Int(sender.value)
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        // replacement comma to dot from decimalpad
        let convBill = bill.replacingOccurrences(of: ",", with: ".")
        
        if bill != ""{
            billTotal = Double(convBill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            print(result)
            let formatingResult = String(format: "%.2f", result)
            print(formatingResult)
        }
    }
}





