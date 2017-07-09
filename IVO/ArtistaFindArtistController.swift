//
//  ArtistaFindArtistController.swift
//  IVO
//
//  Created by user on 11/21/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import Foundation
import UIKit

class ArtistaFindArtistController: UIViewController {
    
    @IBOutlet weak var S1: UISwitch!
    @IBOutlet weak var S2: UISwitch!
    @IBOutlet weak var S3: UISwitch!
    @IBOutlet weak var S4: UISwitch!
    @IBOutlet weak var S5: UISwitch!
    @IBOutlet weak var S6: UISwitch!
    @IBOutlet weak var S7: UISwitch!
    @IBOutlet weak var S8: UISwitch!
    @IBOutlet weak var S9: UISwitch!
    @IBOutlet weak var S10: UISwitch!
    @IBOutlet weak var S11: UISwitch!
    @IBOutlet weak var S12: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        S1.transform = CGAffineTransform(scaleX: 0.7, y: 0.7);
        S2.transform = CGAffineTransform(scaleX: 0.7, y: 0.7);
        S3.transform = CGAffineTransform(scaleX: 0.7, y: 0.7);
        S4.transform = CGAffineTransform(scaleX: 0.7, y: 0.7);
        S5.transform = CGAffineTransform(scaleX: 0.7, y: 0.7);
        S6.transform = CGAffineTransform(scaleX: 0.7, y: 0.7);
        S7.transform = CGAffineTransform(scaleX: 0.7, y: 0.7);
        S8.transform = CGAffineTransform(scaleX: 0.7, y: 0.7);
        S9.transform = CGAffineTransform(scaleX: 0.7, y: 0.7);
        S10.transform = CGAffineTransform(scaleX: 0.7, y: 0.7);
        S11.transform = CGAffineTransform(scaleX: 0.7, y: 0.7);
        S12.transform = CGAffineTransform(scaleX: 0.7, y: 0.7);

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Atras", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
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
