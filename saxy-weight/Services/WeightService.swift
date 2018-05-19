//
//  WeightService.swift
//  saxy-weight
//
//  Created by Alan Sax on 4/6/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import Foundation


class WeightService {
    
    var weights = [Weight]()
    
    static var instance = WeightService()
    
    func addWeight(weight: Weight){
        
        let weightToAdd = weight
        
        if weights.count == 0 {
            print("HEY adding initial weight")
            return weights.append(weight);
        }
        
        for i in 0...weights.count  {
            if formatDate(date: weightToAdd.date) == formatDate(date: weights[i].date) {
                print("HEY updating existing weight")
                return weights[i].weight = weightToAdd.weight
            } else {
                print("HEY adding another weight for another day")
                return weights.append(weight)
            }
        }
    }
    
    func deleteWeight(weight: Weight) {
        
        return weights = weights.filter {$0 !== weight}
        
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
    
    func updateWeights(weight: Weight) {
        
    }
    
}
