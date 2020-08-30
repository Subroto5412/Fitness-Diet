//
//  FADMaxMusicPlayerController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 19/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADMaxMusicPlayerController: UIViewController {
    @IBOutlet weak var titleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLbl.text = "Harder, Better,\n Faster, Stronger"
    }
}
