//
//  DetailsAuditionsController.swift
//  IVO
//
//  Created by user on 1/24/17.
//  Copyright © 2017 3dlink. All rights reserved.
//

import Foundation
import UIKit


class DetailsAuditionsIndustryController : UIViewController{
    
    @IBOutlet weak var min: UIView!
    @IBOutlet weak var hors: UIView!
    @IBOutlet weak var dias: UIView!
    
    @IBOutlet weak var seeCasting: UIButton!
    @IBOutlet weak var delete: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        min.layer.borderWidth = 2
        min.layer.borderColor = UIColor.white.cgColor
        
        hors.layer.borderWidth = 2
        hors.layer.borderColor = UIColor.white.cgColor
        
        dias.layer.borderWidth = 2
        dias.layer.borderColor = UIColor.white.cgColor
        
        seeCasting.layer.borderWidth = 2
        seeCasting.layer.borderColor = UIColor(colorLiteralRed: 0/255, green: 196/255, blue: 180/255, alpha: 1.0).cgColor
        
        delete.layer.borderWidth = 2
        delete.layer.borderColor = UIColor(colorLiteralRed: 0/255, green: 196/255, blue: 180/255, alpha: 1.0).cgColor
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
