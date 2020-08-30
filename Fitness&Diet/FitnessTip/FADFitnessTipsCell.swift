//
//  FADFitnessTipsCell.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 1/8/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADFitnessTipsCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var itemImg: UIImageView!
    @IBOutlet weak var detailsLbl: UILabel!
    
    @IBOutlet weak var imgHeight: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
