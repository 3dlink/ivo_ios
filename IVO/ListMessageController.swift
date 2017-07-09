//
//  ListMessageController.swift
//  IVO
//
//  Created by user on 1/17/17.
//  Copyright © 2017 3dlink. All rights reserved.
//

import Foundation
import UIKit

class ListMessageController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var messageTab: UISegmentedControl!
    @IBOutlet weak var badge: UIView!
    @IBOutlet weak var msgTable: UITableView!

    let nameProfile = ["Agregó nuevo video","Agregó nuevo video","Agregó nuevo video","Agregó nuevo video","Agregó nuevo video","Agregó nuevo video","Agregó nuevo video"]
    
    let imgProfile = [UIImage(named:"Photo1.png"),UIImage(named:"Photo1.png"),UIImage(named:"Photo1.png"),UIImage(named:"Photo1.png"),UIImage(named:"Photo1.png"),UIImage(named:"Photo1.png"),UIImage(named:"Photo1.png")]
    
    override func viewDidLoad() {
        badge.layoutIfNeeded()
        badge.layer.cornerRadius = badge.frame.size.width/2
        badge.clipsToBounds = true
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.navigationBar.isHidden = false
        self.navigationItem.setHidesBackButton(true, animated:false);
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let image = UIImage(named: "LogoTop.png")
        imageView.image = image
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let msg = self.msgTable.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! CellMessage
        
        msg.nameMsg.text = "Nombre";
        msg.resMsg.text = "Resumen del mensaje"
        msg.imageMsg.image = imgProfile[indexPath.row]?.circle
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(red: 0/255, green: 196/255, blue: 180/255, alpha: 1.0)
        
        if(indexPath.item % 3 == 0){
            msg.statusMsg.backgroundColor = UIColor(red: 0/255, green: 196/255, blue: 180/255, alpha: 1.0)
        }
        else{
            msg.statusMsg.backgroundColor = UIColor.clear
        }
        
        msg.selectedBackgroundView = bgColorView
        
        
        return msg
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item) perra!!")
        
    }
    
    
    
}

