//
//  FADDietPlanCell.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 17/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADDietPlanCell: UITableViewCell {

    @IBOutlet weak var recipePic: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
