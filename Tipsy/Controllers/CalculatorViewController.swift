//
//  ViewController.swift
//  Tipsy
//
//  Created by Сергей on 24.01.2022.
//  Copyright © 2022 STDevelopment. All rights reserved.
//

import UIKit

    

class CalculatorViewController: UIViewController {
    
    var model = Model()
    var tip = 0.1
    var numberOfPeople = 2
    var billTotal = 0.0
    var buttonTitle = ""
    
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
    
    @IBAction func tipChanged(_ sender: UIButton) {
        updButtons()
        billTextField.endEditing(true)
        sender.isSelected = true
        buttonTitle = sender.currentTitle!
        tip = model.convertTip(button: buttonTitle)
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
        let convBill = model.convBill(bill)
        
        if bill != ""{
            billTotal = convBill
            let billResult = model.getResult(billTotal: billTotal, numberOfPeople: numberOfPeople, tip: tip)
            self.performSegue(withIdentifier: "goToResult", sender: self)
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = model.getResult(billTotal: billTotal, numberOfPeople: numberOfPeople, tip: tip)
            destinationVC.tip = model.getTipTitle(buttonTitle)
            destinationVC.numberOfPeople = model.getNumberOfPeople(numberOfPeople)
        }
    }
}





