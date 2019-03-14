//
//  ViewController.swift
//  ComplexTableViewDemo
//
//  Created by 赛峰 施 on 2019/3/14.
//  Copyright © 2019 PETER SHI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let dataDic = ["Today": [["Des":["text1": "hello","text2": "haha","text3": "hehe","text4": "wuwu"]], ["Status":["text": "I love you","image": "https://res.cloudinary.com/petershi/image/upload/v1552541928/Target.png"]], ["BigImg":["text": "Here we go","image": "https://res.cloudinary.com/petershi/image/upload/v1552541928/Target.png"]]],
                   "Yestoday": [["Des":["text1": "Tom","text2": "Jack","text3": "Peter","text4": "Helen"]], ["Status":["text": "I hate you","image": "https://res.cloudinary.com/petershi/image/upload/v1552541928/Target.png"]], ["BigImg":["text": "Have a nice day","image": "https://res.cloudinary.com/petershi/image/upload/v1552541928/Target.png"]]],
                   "LastDay": [["Des":["text1": "China","text2": "Canda","text3": "Japan","text4": "Amecrican"]], ["Status":["text": "I like you","image": "https://res.cloudinary.com/petershi/image/upload/v1552541928/Target.png"]], ["BigImg":["text": "That is amazing","image": "https://res.cloudinary.com/petershi/image/upload/v1552541928/Target.png"]]]
    ]
    
    var dataSections: [Section] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSections = configureData(dataDic)
    }

    func configureData(_ dic: [String: [[String: [String: String]]]]) -> [Section] {
        var sections = [Section]()
        for (key, value) in dic {
            var section = Section()
            section.title = key
            value.forEach {
                if $0.keys.first! == "Des" {
                    var desCellModel = DescriptionCellModel()
                    desCellModel.text1 = ($0.values.first?["text1"])!
                    desCellModel.text2 = ($0.values.first?["text2"])!
                    desCellModel.text3 = ($0.values.first?["text3"])!
                    desCellModel.text4 = ($0.values.first?["text4"])!
                    section.cellModels.append(FeedItem.Des(desCellModel))
                } else if $0.keys.first! == "Status" {
                    var statusCellModel = StatusCellModel()
                    statusCellModel.text = ($0.values.first?["text"])!
                    statusCellModel.imageURLString = ($0.values.first?["image"])!
                    section.cellModels.append(FeedItem.Status(statusCellModel))
                } else if $0.keys.first! == "BigImg" {
                    var bigImgCellModel = BigImgCellModel()
                    bigImgCellModel.text = ($0.values.first?["text"])!
                    bigImgCellModel.bigImageURLString = ($0.values.first?["image"])!
                    section.cellModels.append(FeedItem.BigImg(bigImgCellModel))
                }
            }
            sections.append(section)
        }
        return sections
    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = dataSections[section]
        return section.cellModels.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = dataSections[section]
        return section.title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = dataSections[indexPath.section].cellModels[indexPath.row]
        switch cellModel {
        case .Des(let desCM):
            let cell = tableView.dequeueReusableCell(withIdentifier: "Type1TableViewCell", for: indexPath) as! Type1TableViewCell
            cell.model = desCM
            return cell
        case .Status(let statusCM):
            let cell = tableView.dequeueReusableCell(withIdentifier: "Type2TableViewCell", for: indexPath) as! Type2TableViewCell
            cell.model = statusCM
            return cell
        case .BigImg(let bigImgCM):
            let cell = tableView.dequeueReusableCell(withIdentifier: "Type3TableViewCell", for: indexPath) as! Type3TableViewCell
            cell.model = bigImgCM
            return cell
        }
    }
    
    
}
