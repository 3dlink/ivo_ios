//
//  RegisterController.swift
//  IVO
//
//  Created by user on 9/27/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import Foundation
import UIKit
import FBSDKLoginKit

class MenuController: UIViewController,FBSDKLoginButtonDelegate {
    public func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
    
    }

    
    @IBOutlet weak var boundMessage: UILabel!
    let HiddenFacebook = FBSDKLoginButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(HiddenFacebook)

        HiddenFacebook.isHidden = true
        HiddenFacebook.delegate = self
        boundMessage.layer.cornerRadius = 10
        boundMessage.layer.masksToBounds = true
//        navigationController!.popToViewController(navigationController!.viewControllers[0], animated: true)

    }
    
    @IBAction func logout(_ sender: AnyObject)
    {
        HiddenFacebook.sendActions(for: UIControlEvents.touchUpInside)

    }
    
    public func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Login")
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
