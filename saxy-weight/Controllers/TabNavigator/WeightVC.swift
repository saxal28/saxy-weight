//
//  WeightVC.swift
//  saxy-weight
//
//  Created by Alan Sax on 4/5/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class WeightVC: UIViewController {
    
    var hasEnteredWeight = false
    
    //MARK: IB OUTLETS
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var weightCard: Card!
    
    
    //MARK: IB ACTIONS
    @IBAction func addButtonPressed(_ sender: Any) {
        
        let weight = weightInput.text!
        
        if(weight.isEmpty) {
            weightInput.becomeFirstResponder()
        } else {
            addWeight(stringWeight: weight)
        }
        
    }
    @IBAction func saveButtonPressed(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weightCard.addShadow()
        
        weightInput.becomeFirstResponder()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        print("keyboardWillShow")
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        print("keyboardWillHide")
    }
    
    func addWeight(stringWeight weight: String){
        let date = Date()
        let weight = Double(weight)!
        
        let weightModel = Weight(selectedWeight: weight, selectedDate: date)
        
        WeightService.instance.addWeight(weight: weightModel)
        
        handleWeightSubmit()
    }
    
    func handleWeightSubmit(){
//        let lastWeight = WeightService.instance.weights.last!.weight
//        weightInput.text = ""
//        weightInput.placeholder = "Previous: \(lastWeight)"
        weightInput.endEditing(true)
        
        performSegue(withIdentifier: "toHomeScreen", sender: nil)
    }

}
