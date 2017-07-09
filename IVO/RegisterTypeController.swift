//
//  RegisterController.swift
//  IVO
//
//  Created by user on 9/27/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import Foundation
import UIKit

class RegisterTypeController: UIViewController {
    @IBOutlet weak var Artista: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func ProfileProvider(_ sender: AnyObject) {
        let type =  sender.currentTitle!
        GlobalVariable.TypeUser = type!
        let storyBoard : UIStoryboard = UIStoryboard(name: "Proveedores", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DashboardProveedor")
        self.present(nextViewController, animated:true, completion:nil)
    }

    @IBAction func ProfileIndustry(_ sender: AnyObject) {
        let type =  sender.currentTitle!
        GlobalVariable.TypeUser = type!
        let storyBoard : UIStoryboard = UIStoryboard(name: "Industrias", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DashboardIndustria")
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    @IBAction func ProfileArtista(_ sender: AnyObject) {

        let type =  sender.currentTitle!
        GlobalVariable.TypeUser = type!
        let storyBoard : UIStoryboard = UIStoryboard(name: "Artistas", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DashboardArtista")
        self.present(nextViewController, animated:true, completion:nil)
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
    
    
}
