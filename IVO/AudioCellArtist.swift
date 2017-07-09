//
//  AudioCellArtist.swift
//  IVO
//
//  Created by user on 11/28/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import UIKit

class AudioCellArtist: UITableViewCell {

    @IBOutlet weak var statusSound: UIButton!
    @IBOutlet weak var nameSound: UILabel!
    @IBOutlet weak var timerSound: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
