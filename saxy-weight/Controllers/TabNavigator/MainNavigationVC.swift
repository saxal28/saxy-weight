//
//  MainNavigationVC.swift
//  saxy-weight
//
//  Created by Alan Sax on 5/2/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class MainNavigationVC: UIViewController {
    
    // ====================================
    //MARK: IB OUTLETS
    // ====================================
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet var tabButtons: [UIButton]!
    
    // ====================================
    //MARK: IB ACTIONS
    // ====================================
    @IBAction func handleTabPress(_ sender: Any) {
        
        print("pressed")
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
