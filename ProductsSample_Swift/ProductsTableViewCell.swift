//
//  ProductsTableViewCell.swift
//  ProductsSample_Swift
//
//  Created by TEJA on 24/08/15.
//  Copyright (c) 2015 Satya Swaroop. All rights reserved.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var productLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
