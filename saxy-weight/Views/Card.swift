//
//  Card.swift
//  saxy-weight
//
//  Created by Alan Sax on 4/5/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

@IBDesignable
class Card: UIView {
    
    @IBOutlet var cardView: Card!
    
    override func prepareForInterfaceBuilder() {
        commonInit()
    }
    
    func addShadow(){
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 2.0
        self.layer.shadowColor = UIColor.black.cgColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        addShadow()
        self.backgroundColor = #colorLiteral(red: 0.2588235294, green: 0.2980392157, blue: 0.3294117647, alpha: 1)
        self.layer.cornerRadius = 10
        
    }
    
}
