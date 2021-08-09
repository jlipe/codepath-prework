//
//  ViewController.swift
//  Prework
//
//  Created by James Lipe on 7/23/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var currentTipPercent: UILabel!
    @IBOutlet weak var tipControl: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Tip Calculator"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//
        billAmountTextField.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        billAmountTextField.becomeFirstResponder()
        
        let defaults = UserDefaults.standard
        let defaultTipPercentage = defaults.string(forKey: "tipPercentage") ?? "18"
        
        let defaultTipFloat = (Float(defaultTipPercentage) ?? 18.0) / 100.0
        
        tipControl.setValue(defaultTipFloat, animated: true)
        
        view.addGestureRecognizer(tap)
        currentTipPercent.text = String(format: "Current tip %%: %u", Int(defaultTipFloat * 100))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let defaultTipPercentage = defaults.string(forKey: "tipPercentage") ?? "18"
        
        let defaultTipFloat = (Float(defaultTipPercentage) ?? 18.0) / 100.0
        tipControl.setValue(defaultTipFloat, animated: true)
        
        currentTipPercent.text = String(format: "Current tip %%: %u", Int(tipControl.value * 100))
        
        calculateTip(self)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }


    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tip = bill * Double(tipControl.value)
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func adjustSlider(_ sender: Any) {
        calculateTip(self)
        currentTipPercent.text = String(format: "Current tip %%: %u", Int(tipControl.value * 100))
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        calculateTip(self)
    }
}

