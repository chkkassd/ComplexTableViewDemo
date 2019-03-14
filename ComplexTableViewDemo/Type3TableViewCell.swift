//
//  Type3TableViewCell.swift
//  ComplexTableViewDemo
//
//  Created by 赛峰 施 on 2019/3/14.
//  Copyright © 2019 PETER SHI. All rights reserved.
//

import UIKit

class Type3TableViewCell: UITableViewCell {

    @IBOutlet weak var bigImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var model: BigImgCellModel! {
        didSet {
            descriptionLabel.text = model.text
            let url = URL(string: model.bigImageURLString)
            let data = try! Data(contentsOf: url!)
            bigImageView.image = UIImage(data: data)
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
