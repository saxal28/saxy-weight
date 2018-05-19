//
//  LogbookVC.swift
//  saxy-weight
//
//  Created by Alan Sax on 4/5/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class LogbookVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(WeightService.instance.weights)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WeightService.instance.weights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weightCell", for: indexPath) as! WeightCell
        let data = WeightService.instance.weights[indexPath.row]
        let date = formatDate(date: data.date)
        
        print("row!", indexPath.row)
        
        cell.updateCell(date: date, weight: "\(data.weight)", weightChange: "0.3")
        
        return cell
    }
    
    // renders delete button with action
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "delete") { (action, indexPath) in
            // delete item at indexPath
            print("CLICKED!")
            WeightService.instance.deleteWeight(weight: WeightService.instance.weights[indexPath.row])
            
            tableView.reloadData();
            
        }
        
        delete.backgroundColor = #colorLiteral(red: 1, green: 0.2643394768, blue: 0.4393780231, alpha: 1)
        
        return [delete]
    }


}
