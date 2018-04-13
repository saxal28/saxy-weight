//
//  WeightCell.swift
//  saxy-weight
//
//  Created by alan on 4/11/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class WeightCell: UITableViewCell {
    
    // ===========================================
    // MARK: IB OUTLETS
    // ===========================================
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightChangeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
