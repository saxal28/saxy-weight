//
//  WeightVC.swift
//  saxy-weight
//
//  Created by Alan Sax on 4/5/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class WeightVC: UIViewController {
    
    let keyboardButton = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
    var selectedDate = Date()
    var isEditingWeight = false
    
    //===========================================
    //MARK: IB OUTLETS
    //===========================================
    
    
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var dateInput: UIButton!
    @IBOutlet weak var weightCard: Card!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var header: UIView!
    
    
    //===========================================
    //MARK: IB ACTIONS
    //===========================================
    
    
    @IBAction func dateInputPressed(_ sender: Any) {
//        weightInput.endEditing(true)
//        setupDatePicker(date: selectedDate)
    }
    
    
    
    //===========================================
    //MARK: LIFECYCLE / VIEW RELATED
    //===========================================

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        determineIfEditingWeight()
        
        weightInput.becomeFirstResponder()
        setupAddWeightButton()
        setupDateInput()
    
    }
    
    func setupAddWeightButton(){
        let keyboardButton = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 60))
        
        keyboardButton.backgroundColor = isEditingWeight ? #colorLiteral(red: 0.2392156863, green: 0.7490196078, blue: 1, alpha: 1) : #colorLiteral(red: 1, green: 0.2643394768, blue: 0.4393780231, alpha: 1)
        keyboardButton.setTitle(isEditingWeight ? "Edit Weight" : "Save Weight", for: .normal)
        keyboardButton.titleLabel!.font = UIFont(name: Font.bold.rawValue, size: 18.0)
        keyboardButton.addTarget(self, action: #selector(addWeightPressed), for: .touchUpInside)
        weightInput.inputAccessoryView = keyboardButton
    }
    
    func setupDateInput(){
        let date = getToday()
        dateInput.setTitle(date, for: .normal)
    }
    
//    func setupDatePicker(date: Date){
//        let picker = DateTimePicker.show()
//        picker.selectedDate = date
//        picker.highlightColor = isEditingWeight ? #colorLiteral(red: 0.2392156863, green: 0.7490196078, blue: 1, alpha: 1) : #colorLiteral(red: 1, green: 0.2643394768, blue: 0.4393780231, alpha: 1)
//        picker.isDatePickerOnly = true
//        picker.completionHandler = { date in
//            self.selectedDate = date
//            self.dateInput.setTitle(formatDate(date: date), for: .normal)
//            self.weightInput.becomeFirstResponder()
//        }
//    }
    
    func determineIfEditingWeight(){
        
        if WeightService.instance.hasEnteredWeightToday() {
            setupUIForEditMode()
        }
        
    }
    
    func setupUIForEditMode(){
        
        weightInput.text = String(WeightService.instance.getTodaysWeight()!.weight)
        headerTitle.text = "Edit Weight"
        isEditingWeight = true
        
        header.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.7490196078, blue: 1, alpha: 1)
        
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
