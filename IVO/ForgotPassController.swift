//
//  RegisterController.swift
//  IVO
//
//  Created by user on 9/27/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import Foundation
import UIKit

class ForgotPassController: UIViewController, UITextFieldDelegate{
    

    @IBOutlet weak var ScrollElement: UIScrollView!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textUser: UITextField!
    override func viewDidLoad() {
        let myColor : UIColor = UIColor(red: 0, green: 196, blue: 180, alpha: 1)
        textUser.layer.borderColor = myColor.cgColor
        textUser.layer.borderWidth = 1.0

        textEmail.layer.borderColor = myColor.cgColor
        textEmail.layer.borderWidth = 1.0
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
//        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.goForgot))
//        forgotPass.isUserInteractionEnabled = true
//        forgotPass.addGestureRecognizer(gestureRecognizer)
        
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
        contentInset.bottom = keyboardFrame.size.height + 100
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
        if(textField == textEmail){
            ScrollElement.setContentOffset(CGPoint(x:0, y:200), animated: true)
        }
        if(textField == textUser){
            ScrollElement.setContentOffset(CGPoint(x:0, y:200), animated: true)
        }
        
        return true;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @IBAction func BackLogin(_ sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login")
        self.present(vc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
