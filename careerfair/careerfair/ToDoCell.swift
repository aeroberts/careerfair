//
//  ToDoCell.swift
//  careerfair
//
//  Created by Alex Roberts on 8/24/16.
//  Copyright © 2016 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var title: UILabel!
    var id = -1;
    var isOrg = false;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
