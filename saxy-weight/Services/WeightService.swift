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
        weights.append(weight);
        print("Weights", weights)
    }
}
