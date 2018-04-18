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
    
    //===========================================
    //MARK: IB OUTLETS
    //===========================================
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var weightCard: Card!
    
    //===========================================
    //MARK: IB ACTIONS
    //===========================================

    
    //===========================================
    //MARK: LIFECYCLE / VIEW RELATED
    //===========================================

    
    override func viewDidLoad() {
        super.viewDidLoad()
        weightCard.addShadow()
        
        weightInput.becomeFirstResponder()
        setupAddWeightButton()

    }
    
    func setupAddWeightButton(){
        let keyboardButton = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        keyboardButton.backgroundColor = #colorLiteral(red: 1, green: 0.2642144561, blue: 0.4392985404, alpha: 1)
        keyboardButton.setTitle("Add Weight", for: .normal)
        keyboardButton.titleLabel!.font = UIFont(name: "Avenir Next Condensed", size: 18.0)
        keyboardButton.addTarget(self, action: #selector(addWeightPressed), for: .touchUpInside)
        weightInput.inputAccessoryView = keyboardButton
    }
    
    //===========================================
    //MARK: ADD WEIGHT FUNCTIONS
    //===========================================
    
    
    @objc func addWeightPressed(){
        print("PRESSED!!!!")
        addWeight()
    }
    
    func addWeight(){
        let weight = weightInput.text!
        let selectedDate = Date()
        guard let selectedWeight = Double(weight) else {
            print("no weight entered")
            return
        }
        
        let weightModel = Weight(selectedWeight: selectedWeight, selectedDate: selectedDate)
        WeightService.instance.addWeight(weight: weightModel)
        
        performSegue(withIdentifier: "toHomeScreen", sender: nil)

    }
    

}
