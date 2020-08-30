//
//  FADMusicCell.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 19/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADMusicCell: UITableViewCell {

    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var photo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
