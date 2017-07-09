//
//  CellNotificationsArtistas.swift
//  IVO
//
//  Created by user on 11/15/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import UIKit

class CellNotificationsArtistas: UITableViewCell {

    @IBOutlet weak var descriptionNotification: UITextView!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var nameProfile: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
