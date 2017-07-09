//
//  ListAuditionsIndustryController.swift
//  IVO
//
//  Created by user on 1/31/17.
//  Copyright © 2017 3dlink. All rights reserved.
//

import Foundation
import UIKit

class ListAuditionsIndustryController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let nameProfile = ["Agregó nuevo video","Agregó nuevo video","Agregó nuevo video","Agregó nuevo video","Agregó nuevo video","Agregó nuevo video","Agregó nuevo video"]
    
    let imgProfile = [UIImage(named:"Photo1.png"),UIImage(named:"Photo1.png"),UIImage(named:"Photo1.png"),UIImage(named:"Photo1.png"),UIImage(named:"Photo1.png"),UIImage(named:"Photo1.png"),UIImage(named:"Photo1.png")]
    
    @IBOutlet weak var audicionIndustryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let audition = self.audicionIndustryTable.dequeueReusableCell(withIdentifier: "auditionIndustryCell", for: indexPath) as! CellAuditionsIndustry
        
        audition.audImg.image = imgProfile[indexPath.row]?.circle
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(red: 0/255, green: 196/255, blue: 180/255, alpha: 1.0)
        
        audition.selectedBackgroundView = bgColorView

        
        return audition
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item) perra!!")
        
    }
    
    
}


