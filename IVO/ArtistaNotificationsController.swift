//
//  NotificationsArtistaController.swift
//  IVO
//
//  Created by user on 11/15/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class ArtistaNotificationsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var notificationsTable: UITableView!

    let nameProfile = ["Agregó nuevo video","Agregó nuevo video","Agregó nuevo video"]
    
    let imgProfile = [UIImage(named:"Photo1.png"),UIImage(named:"Photo1.png"),UIImage(named:"Photo1.png")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ntf = self.notificationsTable.dequeueReusableCell(withIdentifier: "notificationsCell", for: indexPath) as! CellNotificationsArtistas
        
        ntf.imageProfile.image = imgProfile[indexPath.row]?.circle

        
        ntf.nameProfile.text = nameProfile[indexPath.row]
        ntf.descriptionNotification.text = "Pellentesque quis varius dolor, et consequat odio."
        
        return ntf
    }
    
}
extension UIImage {
    var circle: UIImage? {
        let square = CGSize(width: min(size.width, size.height), height: min(size.width, size.height))
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: square))
        imageView.contentMode = .scaleAspectFill
        imageView.image = self
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}
