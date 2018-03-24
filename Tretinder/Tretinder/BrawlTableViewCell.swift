//
//  BrawlTableViewCell.swift
//  Tretinder
//
//  Created by Jimy Suenaga on 05/01/18.
//  Copyright © 2018 Jimysses. All rights reserved.
//

import UIKit

class BrawlTableViewCell: UITableViewCell {

    @IBOutlet weak var brawlCellTitle: UILabel!
    @IBOutlet weak var leftBrandImage: UIImageView!
    @IBOutlet weak var rightBrandImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
