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
    
    @IBOutlet var tabs: [TabButton]!
    @IBOutlet weak var todayWeightLabel: UILabel!
    @IBOutlet weak var todayActionLabel: UILabel!
    
    //MARK: IB ACTIONS
    @IBAction func tabPressed(_ sender: TabButton) {
        print(sender.tag);
        
        tabs[sender.tag].alpha = 1
        
        if sender.tag != previousTab {
            tabs[previousTab].alpha = 0.4
            previousTab = sender.tag
        }

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: VIEW / SETUP RELATED
    
    func setupView(){
        
        if(service.hasEnteredWeightToday()) {
            let todayWeight = service.getTodaysWeight()
            
            todayWeightLabel.text = "Today's Weight"
            todayWeightLabel.font = UIFont(name:"AvenirNextCondensed-Regular", size: 18)

            
            todayActionLabel.text = String(todayWeight!.weight)
            todayActionLabel.font = UIFont(name:"AvenirNextCondensed-Bold", size: 24)
            
        }
        
    }


}
