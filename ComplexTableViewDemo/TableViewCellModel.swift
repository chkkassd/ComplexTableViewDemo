//
//  TableViewCellModel.swift
//  ComplexTableViewDemo
//
//  Created by 赛峰 施 on 2019/3/14.
//  Copyright © 2019 PETER SHI. All rights reserved.
//

import Foundation

struct DescriptionCellModel {
    var text1 = ""
    var text2 = ""
    var text3 = ""
    var text4 = ""
}

struct StatusCellModel {
    var text = ""
    var imageURLString = ""
}

struct BigImgCellModel {
    var text = ""
    var bigImageURLString = ""
}

enum FeedItem {
    case Des(DescriptionCellModel)
    case Status(StatusCellModel)
    case BigImg(BigImgCellModel)
}

struct Section {
    var title: String = ""
    var cellModels: [FeedItem] = []
}
