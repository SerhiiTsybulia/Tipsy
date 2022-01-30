//
//  Model.swift
//  Tipsy
//
//  Created by Сергей on 30.01.2022.
//  Copyright © 2022 STDevelopment. All rights reserved.
//

import UIKit

struct Model {
    
    func convertTip(button: String)->Double{
        // convert title from button to number
        let titleFormating = String(button.dropLast())
        let titleToNumber = Double(titleFormating)!
        let tip = titleToNumber / 100
        return tip
    }
    func convBill(_ bill:String)->Double{
        // replacement comma to dot from decimalpad
        let billWithDot = bill.replacingOccurrences(of: ",", with: ".")
        guard let convBill = Double(billWithDot) else { return 0.0 }
        return convBill
    }
    func getResult(billTotal: Double, numberOfPeople: Int, tip: Double)->String{
        let result = billTotal * (1 + tip) / Double(numberOfPeople)
        let formatingResult = String(format: "%.2f", result)
        return formatingResult
    }
    func getNumberOfPeople(_ numberOfPeople: Int)->String{
        let strNOP = String(numberOfPeople)
        return strNOP
    }
    func getTipTitle(_ title: String)->String{
        let tipTitle = String(title)
        return tipTitle
    }
}
