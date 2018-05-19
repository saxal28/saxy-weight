//
//  MainNavigationVC.swift
//  saxy-weight
//
//  Created by Alan Sax on 5/2/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

enum MainNavigation: String {
    case redVC = "RedVC"
    case blueVC = "BlueVC"
    case homeVC = "HomeVC"
    case logbookVC = "LogbookVC"
    case calendarVC = "CalendarVC"
    case settingsVC = "SettingsVC"
}

class MainNavigationVC: UIViewController {
    
    //MARK: View Controllers to Render
    
    lazy var homeVC: HomeVC = {
        let vc = storyboard?.instantiateViewController(withIdentifier: MainNavigation.homeVC.rawValue ) as! HomeVC
        self.addChildVC(childVC: vc)
        return vc
    }()
    
    lazy var logbookVC: LogbookVC = {
        let vc = storyboard?.instantiateViewController(withIdentifier: MainNavigation.logbookVC.rawValue) as! LogbookVC
        self.addChildVC(childVC: vc)
        return vc
    }()
    
    lazy var calendarVC: CalendarVC = {
        let vc = storyboard?.instantiateViewController(withIdentifier: MainNavigation.calendarVC.rawValue) as! CalendarVC
        self.addChildVC(childVC: vc)
        return vc
    }()
    
    lazy var settingsVC: SettingsVC = {
        let vc = storyboard?.instantiateViewController(withIdentifier: MainNavigation.settingsVC.rawValue) as! SettingsVC
        self.addChildVC(childVC: vc)
        return vc
    }()
    
    // ====================================
    //MARK: IB OUTLETS
    // ====================================
    
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet var tabButtons: [UIButton]!
    @IBOutlet weak var containerView: UIView!
    
    
    // ====================================
    //MARK: IB ACTIONS
    // ====================================
    
    
    @IBAction func tabButtonPressed(_ sender: UIButton) {
        
        handleTabClick(sender: sender)
        
        switch sender.tag {
        case 1:
            setupHomeTab()
        case 2:
            setupLogbookTab()
        case 3:
            setupCalendarTab()
        case 4:
            setupSettingsTab()
        default:
            return setupHomeTab()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeVC.view.isHidden = false
        
    }
    
    // ====================================
    // MARK: function to add child views to container view
    // ====================================

    
    func addChildVC(childVC: UIViewController) {
        addChildViewController(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = CGRect(x: 0, y: 0, width: containerView.frame.size.width, height: containerView.frame.size.height)
        childVC.didMove(toParentViewController: self)
    }
    
    
    // ====================================
    //MARK: SET UP VIEWS
    // ====================================
    
    
    func handleTabClick(sender: UIButton){
        
        for button in tabButtons {
        
            if button.tag == sender.tag {
                
                let icon = "\(button.accessibilityIdentifier!)-active"
                button.setImage(UIImage(named: icon), for: .normal)
                
            }
            
            else {
                
                let icon = "\(button.accessibilityIdentifier!)-inactive"
                button.setImage(UIImage(named: icon), for: .normal)
                
            }
            
        }
        
    }
    
    
    func setupHomeTab(){
        
        headerTitle.text = "Home"
        
        homeVC.view.isHidden = false
        logbookVC.view.isHidden = true
        calendarVC.view.isHidden = true
        settingsVC.view.isHidden = true
    
    }
    
    func setupLogbookTab(){
        
        headerTitle.text = "Logbook"
        
        homeVC.view.isHidden = true
        logbookVC.view.isHidden = false
        calendarVC.view.isHidden = true
        settingsVC.view.isHidden = true
        
        
        
    }
    
    func setupCalendarTab(){
        
        headerTitle.text = "Calendar"
        
        homeVC.view.isHidden = true
        logbookVC.view.isHidden = true
        calendarVC.view.isHidden = false
        settingsVC.view.isHidden = true
    
    }
    
    func setupSettingsTab(){
        
        headerTitle.text = "Settings"
       
        homeVC.view.isHidden = true
        logbookVC.view.isHidden = true
        calendarVC.view.isHidden = true
        settingsVC.view.isHidden = false

    }

}
