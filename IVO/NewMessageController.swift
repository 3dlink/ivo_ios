//
//  NewMessageController.swift
//  IVO
//
//  Created by user on 1/17/17.
//  Copyright © 2017 3dlink. All rights reserved.
//

import Foundation
import UIKit

class NewMessageController: UIViewController {
    
    @IBOutlet weak var toMsg: UITextField!
    @IBOutlet weak var bodyMsg: UITextView!
    

    override func viewDidLoad() {
        bodyMsg!.layer.borderWidth = 2
        bodyMsg!.layer.borderColor = UIColor(red: 0/255, green: 196/255, blue: 180/255, alpha: 1.0).cgColor
        bodyMsg!.text = "Escribe tu mensaje"
        
        bodyMsg!.textColor = UIColor(red: 0/255, green: 196/255, blue: 180/255, alpha: 1.0)
        
        toMsg!.layer.borderWidth = 2
        toMsg!.layer.borderColor = UIColor(red: 0/255, green: 196/255, blue: 180/255, alpha: 1.0).cgColor
        
        toMsg!.attributedPlaceholder = NSAttributedString(string: "Escribe un nombre",attributes: [NSForegroundColorAttributeName: UIColor(red: 0/255, green: 196/255, blue: 180/255, alpha: 1.0)])
        
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
