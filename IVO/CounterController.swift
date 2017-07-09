//
//  CounterController.swift
//  IVO
//
//  Created by user on 1/20/17.
//  Copyright © 2017 3dlink. All rights reserved.
//

import Foundation
import UIKit

class CounterController: UIViewController {
   
    
    @IBOutlet weak var days: UIView!
    @IBOutlet weak var hours: UIView!
    @IBOutlet weak var minutes: UIView!
    @IBOutlet weak var DOIT: UIButton!
    
    override func viewDidLoad() {
        days.layer.borderWidth = 2
        days.layer.borderColor = UIColor.white.cgColor
        
        hours.layer.borderWidth = 2
        hours.layer.borderColor = UIColor.white.cgColor
        
        minutes.layer.borderWidth = 2
        minutes.layer.borderColor = UIColor.white.cgColor
        
        DOIT.layer.borderWidth = 2
        DOIT.layer.borderColor = UIColor.white.cgColor
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

}
