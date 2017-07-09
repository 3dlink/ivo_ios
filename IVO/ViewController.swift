//
//  ViewController.swift
//  IVO
//
//  Created by user on 9/22/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, UITextFieldDelegate, FBSDKLoginButtonDelegate, GIDSignInUIDelegate{

    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var ScrollElement: UIScrollView!
    @IBOutlet weak var textPass: UITextField!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var MsjError: UIView!
    @IBOutlet weak var forgotPass: UILabel!
    @IBOutlet weak var LoginFacebook: UIButton!
    @IBOutlet weak var LoginGoogle: UIButton!
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    let HiddenFacebook = FBSDKLoginButton()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        signInButton.isHidden = true
        MsjError.isHidden = true
        
        HiddenFacebook.readPermissions = ["public_profile", "email", "user_friends"]
        
        let att = NSMutableAttributedString(string: "¿Aún no tienes cuenta? Regístrate aquí");
          att.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSRange(location: 0, length: 23))
        att.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 0, green: 196, blue: 180, alpha: 1), range: NSRange(location: 23, length: 15))
        register.setAttributedTitle(att, for: .normal)

        // Se crea el efecto del teclado para los textDelegate
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.goForgot))
        forgotPass.isUserInteractionEnabled = true
        forgotPass.addGestureRecognizer(gestureRecognizer)
        
        HiddenFacebook.delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }

    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.navigationBar.isHidden = true
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginGoogle(_ sender: AnyObject) {
        signInButton.sendActions(for: UIControlEvents.touchUpInside)
    }
    
    
    @IBAction func Hola(_ sender: AnyObject) {
        HiddenFacebook.sendActions(for: UIControlEvents.touchUpInside)
    }
    
    
    public func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        let parameters = ["fields": "email, first_name, last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start(completionHandler: { (connection, user, requestError) -> Void in
//            let fbAccessToken = FBSDKAccessToken.current()
            if requestError != nil {
                print(requestError)
                return
            }
            let storyBoard : UIStoryboard = UIStoryboard(name: "Artistas", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DashboardArtista")
            self.present(nextViewController, animated:true, completion:nil)
            print(user)
        })
    }
    
    public func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        return;
    }

    
    func goForgot(gestureRecognizer: UIGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "forgotPass")
        self.present(vc, animated: true, completion: nil)
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
        contentInset.bottom = keyboardFrame.size.height + 70
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
            ScrollElement.setContentOffset(CGPoint(x:0, y:100), animated: true)
        }
        if(textField == textPass){
            ScrollElement.setContentOffset(CGPoint(x:0, y:150), animated: true)
        }
        return true;
    }
    
    
    @IBAction func LogIn(_ sender: AnyObject) {
        let email = textEmail.text
        let pass = textPass.text
        
        var access = 0;

        if(isValidEmail(emailStr: email!)){
            access = 1;
        }
        else{
            print("no es valido")
            MsjError.isHidden = false
        }
        if(isValidPass(passStr: pass!)){
            access = 2;
        }
        else{
            print("pass no es valido")
            MsjError.isHidden = false

        }
        _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(closeModal), userInfo: nil, repeats: false)

        if( access == 2 ){
            
        }
        
    }
    
    @IBAction func closeModal(_ sender: AnyObject) {
        MsjError.isHidden = true
    }
    
    func isValidEmail(emailStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailStr)
    }
    
    func isValidPass(passStr: String) -> Bool{
        let passRegEx = "(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
        let passTest = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        return passTest.evaluate(with: passStr)
    }

}

