//
//  Type2TableViewCell.swift
//  ComplexTableViewDemo
//
//  Created by 赛峰 施 on 2019/3/14.
//  Copyright © 2019 PETER SHI. All rights reserved.
//

import UIKit

class Type2TableViewCell: UITableViewCell {

    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var headTextLabel: UILabel!
    
    var model: StatusCellModel! {
        didSet {
            headTextLabel.text = model.text
            let url = URL(string: model.imageURLString)
            let data = try! Data(contentsOf: url!)
            headImageView.image = UIImage(data: data)
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
