//
//  SettingsViewController.swift
//  Prework
//
//  Created by James Lipe on 7/25/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let tipPercentage = defaults.string(forKey: "tipPercentage") ?? ""
        
        tipPercentageTextField.text = tipPercentage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let tipPercentage = tipPercentageTextField.text
        
        defaults.setValue(tipPercentage, forKey: "tipPercentage")
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
