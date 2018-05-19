//
//  InfoBox.swift
//  saxy-weight
//
//  Created by Alan Sax on 5/17/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class InfoBox: UIView {

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupButton()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButton()
    }
    
    func setupButton(){
        self.layer.cornerRadius = 10.0
        
//        self.layer.shadowOpacity = 0.3
//        self.layer.shadowOffset = CGSize(width: 0, height: 3)
//        self.layer.shadowRadius = 3.0
    }

}
