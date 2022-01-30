//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Сергей on 25.01.2022.
//  Copyright © 2022 STDevelopment. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var result: String?
    var tip: String?
    var numberOfPeople: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \(tip!) tip."
        // Do any additional setup after loading the view.
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
