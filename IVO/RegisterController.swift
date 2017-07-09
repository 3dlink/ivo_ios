//
//  RegisterController.swift
//  IVO
//
//  Created by user on 9/27/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import Foundation
//
//  ViewController.swift
//  IVO_Code
//
//  Created by user on 9/22/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import UIKit

class RegisterController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textUser: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPass: UITextField!
    @IBOutlet weak var textConfirmPass: UITextField!
    @IBOutlet weak var Switch: UISwitch!
    @IBOutlet weak var ScrollElement: UIScrollView!

    override func viewDidLoad() {
        let myColor : UIColor = UIColor.white
        textUser.layer.borderColor = myColor.cgColor
        textUser.layer.borderWidth = 1.0
        
        textEmail.layer.borderColor = myColor.cgColor
        textEmail.layer.borderWidth = 1.0
        textPass.layer.borderColor = myColor.cgColor
        textPass.layer.borderWidth = 1.0
        
        textConfirmPass.layer.borderColor = myColor.cgColor
        textConfirmPass.layer.borderWidth = 1.0
        
        Switch.transform = CGAffineTransform(scaleX: 0.5, y: 0.5);
        
        
        // Se crea el efecto del teclado para los textDelegate
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        super.viewDidLoad()

    }
    
    func dismissKeyboard() {
        view.endEditing(true)
        ScrollElement.setContentOffset(CGPoint(x:0, y:0), animated: true)
    }
    
    func keyboardWillShow(notification:NSNotification){
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        var contentInset:UIEdgeInsets = self.ScrollElement.contentInset
        contentInset.bottom = keyboardFrame.size.height + 50
        self.ScrollElement.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.ScrollElement.contentInset = contentInset
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        ScrollElement.setContentOffset(CGPoint(x:0, y:0), animated: true)
        return true;
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField == textUser){
            ScrollElement.setContentOffset(CGPoint(x:0, y:100), animated: true)
        }
        if(textField == textEmail){
            ScrollElement.setContentOffset(CGPoint(x:0, y:150), animated: true)
        }
        if(textField == textPass){
            ScrollElement.setContentOffset(CGPoint(x:0, y:200), animated: true)
        }
        if(textField == textConfirmPass){
            ScrollElement.setContentOffset(CGPoint(x:0, y:250), animated: true)
        }
        return true;
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
        // Dispose of any resources that can be recreated.
    }
    
    
}
