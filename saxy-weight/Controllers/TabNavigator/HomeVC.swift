//
//  HomeVC.swift
//  saxy-weight
//
//  Created by Alan Sax on 4/5/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    var previousTab: Int = 0;
    var service = WeightService.instance;
    
    //MARK: IB OUTLETS

    @IBOutlet weak var todayWeightLabel: UILabel!
    @IBOutlet weak var todayActionLabel: UILabel!
    @IBOutlet weak var addWeightButton: RoundedButton!
    
    //MARK: IB ACTIONS
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: VIEW / SETUP RELATED
    
    func setupView(){
        
        if(service.hasEnteredWeightToday()) {
            
//            addWeightButton.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.7490196078, blue: 1, alpha: 1)
            
            
//            let todayWeight = service.getTodaysWeight()
//
//            todayWeightLabel.text = "Today's Weight"
//            todayWeightLabel.font = UIFont(name:"AvenirNextCondensed-Regular", size: 18)
//
//
//            todayActionLabel.text = String(todayWeight!.weight)
//            todayActionLabel.font = UIFont(name:"AvenirNextCondensed-Bold", size: 24)
            
        }
        
    }


}
