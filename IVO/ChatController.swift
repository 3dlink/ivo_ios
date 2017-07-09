//
//  ChatController.swift
//  IVO
//
//  Created by user on 1/18/17.
//  Copyright © 2017 3dlink. All rights reserved.
//

import Foundation
import UIKit

class ChatController: UIViewController{

    @IBOutlet weak var newMsg: UIView!
    override func viewDidLoad() {
        
        newMsg!.layer.borderWidth = 2
        newMsg!.layer.borderColor = UIColor(red: 0/255, green: 196/255, blue: 180/255, alpha: 1.0).cgColor
        
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
