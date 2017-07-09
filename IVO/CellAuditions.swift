//
//  CellAuditions.swift
//  IVO
//
//  Created by user on 1/24/17.
//  Copyright © 2017 3dlink. All rights reserved.
//

import UIKit

class CellAuditions: UITableViewCell {

    @IBOutlet weak var imgAud: UIImageView!
    @IBOutlet weak var nameAud: UILabel!
    @IBOutlet weak var descriptionAud: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
