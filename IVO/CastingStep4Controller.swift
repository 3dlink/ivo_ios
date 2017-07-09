//
//  CastingStep4Controller.swift
//  IVO
//
//  Created by user on 1/23/17.
//  Copyright © 2017 3dlink. All rights reserved.
//

import Foundation
import UIKit

class CastingStep4Controller : UIViewController{

    @IBOutlet weak var aboutYou: UITextView!
    @IBOutlet weak var why: UITextView!
    
    override func viewDidLoad() {
        
        aboutYou.layer.borderWidth = 2
        aboutYou.layer.borderColor = UIColor(displayP3Red: 0/255, green: 196/255, blue: 179/255, alpha: 1.0).cgColor
        
        why.layer.borderWidth = 2
        why.layer.borderColor = UIColor(displayP3Red: 0/255, green: 196/255, blue: 179/255, alpha: 1.0).cgColor
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationController!.navigationBar.isHidden = false
        self.navigationController!.navigationBar.tintColor = UIColor.white
        
        let view = UIView(frame: CGRect(x:0, y:0, width:25, height:25))
        view.backgroundColor = UIColor.black
        let barButtonItem = UIBarButtonItem(customView: view)
        self.navigationItem.rightBarButtonItem = barButtonItem
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let image = UIImage(named: "LogoTop.png")
        imageView.image = image
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
