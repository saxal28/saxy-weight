//
//  Testy.swift
//  saxy-weight
//
//  Created by Alan Sax on 4/7/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

@IBDesignable
class Testy: UIView {

    @IBInspectable var blockColor: UIColor = UIColor.cyan {
        didSet {
            backgroundColor = blockColor
        }
    }
    
    @IBInspectable var cornerRounding: CGFloat = 10 {
        didSet {
            layer.cornerRadius = cornerRounding
        }
    }
    
    func prepareView(){
        backgroundColor = blockColor
        layer.cornerRadius = cornerRounding
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        prepareView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareView()
    }

}
