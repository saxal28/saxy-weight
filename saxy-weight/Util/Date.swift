//
//  Date.swift
//  saxy-weight
//
//  Created by Alan Sax on 4/18/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import Foundation

func getToday() -> String {
    let today = Date()
    return formatDate(date: today)
}

func formatDate(date: Date) -> String{
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    
    dateFormatter.locale = Locale(identifier: "en_US")
    return dateFormatter.string(from: date)
    
}

