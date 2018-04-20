//
//  WeightVC.swift
//  saxy-weight
//
//  Created by Alan Sax on 4/5/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit
import DateTimePicker

class WeightVC: UIViewController {
    
    
    var selectedDate = Date()
    var isEditingWeight = false
    
    //===========================================
    //MARK: IB OUTLETS
    //===========================================
    
    
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var dateInput: UIButton!
    @IBOutlet weak var weightCard: Card!
    
    
    //===========================================
    //MARK: IB ACTIONS
    //===========================================
    
    
    @IBAction func dateInputPressed(_ sender: Any) {
        weightInput.endEditing(true)
        setupDatePicker(date: selectedDate)
    }
    
    
    
    //===========================================
    //MARK: LIFECYCLE / VIEW RELATED
    //===========================================

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightInput.becomeFirstResponder()
        setupAddWeightButton()
        setupDateInput()
        
        determineIfEditingWeight()

    }
    
    func setupAddWeightButton(){
        let keyboardButton = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        keyboardButton.backgroundColor = #colorLiteral(red: 1, green: 0.2642144561, blue: 0.4392985404, alpha: 1)
        keyboardButton.setTitle("Add Weight", for: .normal)
        keyboardButton.titleLabel!.font = UIFont(name: "Avenir Next Condensed", size: 18.0)
        keyboardButton.addTarget(self, action: #selector(addWeightPressed), for: .touchUpInside)
        weightInput.inputAccessoryView = keyboardButton
    }
    
    func setupDateInput(){
        let date = getToday()
        dateInput.setTitle(date, for: .normal)
    }
    
    func setupDatePicker(date: Date){
        let picker = DateTimePicker.show()
        picker.selectedDate = date
        picker.highlightColor = #colorLiteral(red: 1, green: 0.2643394768, blue: 0.4393780231, alpha: 1)
        picker.isDatePickerOnly = true
        picker.completionHandler = { date in
            self.selectedDate = date
            self.dateInput.setTitle(formatDate(date: date), for: .normal)
            self.weightInput.becomeFirstResponder()
        }
    }
    
    func determineIfEditingWeight(){
        
        if WeightService.instance.hasEnteredWeightToday() {
            isEditingWeight = true
        }
        
    }
    
    
    //===========================================
    //MARK: ADD WEIGHT FUNCTIONS
    //===========================================
    
    
    @objc func addWeightPressed(){
        addWeight()
    }
    
    func addWeight(){
        let weight = weightInput.text!
        
        guard let selectedWeight = Double(weight) else {
            print("no weight entered")
            return
        }
        
        let weightModel = Weight(selectedWeight: selectedWeight, selectedDate: selectedDate)
        WeightService.instance.addWeight(weight: weightModel)
        
        performSegue(withIdentifier: "toHomeScreen", sender: nil)

    }
    

}
