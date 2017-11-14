//
//  GymTableViewCell.swift
//  pushuptracker17
//
//  Created by Jared Alexander on 11/13/17.
//  Copyright © 2017 gwu. All rights reserved.
//

import UIKit

class GymTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gymNameLabel: UILabel!
    @IBOutlet weak var gymAddressLabel: UILabel!
    @IBOutlet weak var gymLogoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
