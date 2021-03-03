//
//  LessonTableViewCell.swift
//  ECOSA
//
//  Created by Gerve-Endy Pluviose on 2/14/21.
//  Copyright © 2021 Gerve-Endy Pluviose. All rights reserved.
//

import UIKit

class LessonTableViewCell: UITableViewCell {

    @IBOutlet var ImageCell: UIImageView!
    @IBOutlet var TitleCell: UILabel!
    @IBOutlet var DateCell: UILabel!
    @IBOutlet var DayCell: UILabel!
    @IBOutlet var ViewCell: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
