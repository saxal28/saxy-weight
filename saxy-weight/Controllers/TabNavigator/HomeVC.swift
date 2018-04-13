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
    
    //MARK: IB OUTLETS
    
    @IBOutlet var tabs: [TabButton]!
    
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
        // Do any additional setup after loading the view.
    }


}
