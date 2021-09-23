//
//  SubjectTableViewCell.swift
//  TimeManagement
//
//  Created by TERANAKA RYO on 2021/09/02.
//

import UIKit

struct Subject{
    var name:String         //項目名
    var music:String        //設定音楽
}

class SubjectTableHeadViewCell:UITableViewCell{
}

class SubjectTableViewCell: UITableViewCell, Nibable {
    
    @IBOutlet private weak var subjectLabel: UILabel!
    @IBOutlet private weak var goalminLabel: UILabel!
    @IBOutlet private weak var actminLabel: UILabel!
    @IBOutlet private weak var subminLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(item: SubjectInfo) {
        
        subjectLabel.text = item.name
        goalminLabel.text = String(item.goalMin)
        actminLabel.text = String(item.actMin)
    }


}
