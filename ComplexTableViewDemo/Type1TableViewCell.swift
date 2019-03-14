//
//  Type1TableViewCell.swift
//  ComplexTableViewDemo
//
//  Created by 赛峰 施 on 2019/3/14.
//  Copyright © 2019 PETER SHI. All rights reserved.
//

import UIKit

class Type1TableViewCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    var model: DescriptionCellModel! {
        didSet {
            label1.text = model.text1
            label2.text = model.text2
            label3.text = model.text3
            label4.text = model.text4
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
