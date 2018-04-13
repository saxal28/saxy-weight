//
//  RoundedButton.swift
//  saxy-weight
//
//  Created by alan on 4/12/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    
    override func prepareForInterfaceBuilder() {
        setupButton()
    }

    func setupButton(){
        self.layer.cornerRadius = 50
        self.backgroundColor = UIColor.green
    }

}
