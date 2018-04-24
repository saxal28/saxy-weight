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
            updateWeight(weight: weight)
        } else {
            weights.append(weight);
        }
        
    }
    
    func getTodaysWeight() -> Weight? {
        for weight in weights {
            
            let today = formatDate(date: Date())
            let date = formatDate(date: weight.date)
            
            if today == date {
               return weight
            }
        }
        return nil
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
        
        let date = formatDate(date: weight.date)
        
        for loopWeight in weights {
            
            let loopDate = formatDate(date: loopWeight.date)
            
            if date == loopDate  {

                print("HEY Updating today's weight")
                loopWeight.date = weight.date
                return

            } else {
                print("HEY Updating Another Day's Weight")
                
                let test = `$`.find([1,2,3,4,5], callback: { $0 == 2 })
                print("HEY", test!)
                
                weights.append(weight)
            }
        }
        
    }
    
}
