//
//  WeightService.swift
//  saxy-weight
//
//  Created by Alan Sax on 4/6/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import Foundation
import Dollar


class WeightService {
    var weights = [Weight]()
    
    static var instance = WeightService()
    
    func addWeight(weight: Weight){
        
        if hasEnteredWeightToday() {
            print("HEY", "You have already entered weight today dummy")
        } else {
            weights.append(weight);
        }
        
    }
    
    func hasEnteredWeightToday() -> Bool {
        for weight in weights {
        
            let today = formatDate(date: Date())
            let date = formatDate(date: weight.date)
            
            if today == date {
                return true
            }
        }
        
        return false
    }
    
    func updateWeight(weight: Weight){
        
    }
    
}
