//
//  OrganizationTableViewCell.swift
//  careerfair
//
//  Created by Alexander Roberts on 8/1/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

class OrganizationTableViewCell: UITableViewCell {
    @IBOutlet weak var orgTitleLabel: UILabel!
    @IBOutlet weak var orgDateLabel: UILabel!
    
    @IBAction func touchFavoriteButton(sender: AnyObject) {
    }
    @IBOutlet weak var favoritedButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
