//
//  CellAuditionsIndustry.swift
//  IVO
//
//  Created by user on 1/31/17.
//  Copyright © 2017 3dlink. All rights reserved.
//

import UIKit

class CellAuditionsIndustry: UITableViewCell {


    @IBOutlet weak var audName: UILabel!

    @IBOutlet weak var audImg: UIImageView!
    
    @IBOutlet weak var audDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
