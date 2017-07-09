//
//  CellMessage.swift
//  IVO
//
//  Created by user on 1/17/17.
//  Copyright © 2017 3dlink. All rights reserved.
//

import UIKit

class CellMessage: UITableViewCell {

    @IBOutlet weak var statusMsg: UIView!
    @IBOutlet weak var imageMsg: UIImageView!
    @IBOutlet weak var nameMsg: UILabel!
    @IBOutlet weak var resMsg: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
