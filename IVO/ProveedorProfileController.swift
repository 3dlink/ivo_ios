//
//  IndustriaProfileController.swift
//  IVO
//
//  Created by user on 11/22/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import Foundation
import UIKit

class ProveedorProfileController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextViewDelegate {
    
    @IBOutlet weak var ContainerCV: UIView!
    @IBOutlet weak var CView: UICollectionView!
    @IBOutlet weak var Follow: UIButton!
    @IBOutlet weak var controlPagina: UIPageControl!
    @IBOutlet weak var Tags: UISegmentedControl!
    @IBOutlet weak var bioText: UITextView!
    @IBOutlet weak var pencilBio: UIButton!
    @IBOutlet weak var modalNetworks: UIView!
    @IBOutlet weak var buttonFacebook: UIButton!
    @IBOutlet weak var buttonTwitter: UIButton!
    @IBOutlet weak var buttonInstagram: UIButton!
    @IBOutlet weak var facebookUrl: UITextField!
    
    @IBOutlet weak var twitterUrl: UITextField!
    @IBOutlet weak var instagramUrl: UITextField!
    @IBOutlet weak var webUrl: UITextField!
    @IBOutlet weak var buttonWeb: UIButton!
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28"]
    
    let reuseIdentifier2 = "castingCell"
    // also enter this string as the cell identifier in the storyboard
    
    // MARK: - UICollectionViewFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let picDimension = CView.frame.size.width / 3
            return CGSize(width: picDimension, height: picDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsetsMake(-0.05,-0.05,-0.05,-0.05)
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            cell.layer.borderWidth = 2.0
//            cell.layer.borderColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
            cell.myLabel.text = self.items[indexPath.item]
            return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
            print("You selected cell #\(indexPath.item)!")
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            controlPagina.currentPage = Int(pageNumber)
        
    }
    
    
    @IBAction func changPg(_ sender: AnyObject) {
        let x = CGFloat(controlPagina.currentPage) * CView.frame.size.width
        CView.setContentOffset(CGPoint(x:x, y:0), animated: true)
        controlPagina.currentPage = Int(controlPagina.currentPage)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bioText.setContentOffset(CGPoint.zero, animated: false)
    }
    
    func attributedString(from string: String, range: NSRange?) -> NSAttributedString {
        
        
        let myMutableString = NSMutableAttributedString(string: string)
        myMutableString.addAttribute(NSForegroundColorAttributeName,value: UIColor.black,range: range!)
        return myMutableString
    }
    
    
    @IBAction func editBio(_ sender: AnyObject) {
        
        if(bioText.isEditable){
            let img = UIImage(named:"pencilEdit.png")
            pencilBio.setBackgroundImage(img, for: .normal)
            bioText.isEditable = false
            bioText.backgroundColor = UIColor.clear
            bioText.textColor = UIColor.white
        }
        else{
            let img = UIImage(named:"saveProvider.png")
            pencilBio.setBackgroundImage(img, for: .normal)
            bioText.isEditable = true
            bioText.backgroundColor = UIColor.white
            bioText.textColor = UIColor.black
        }
    }
    
    @IBAction func editUrl(_ sender: AnyObject) {
        modalNetworks.isHidden = false
    }

    
    
    @IBAction func editNetworks(_ sender: AnyObject) {
        if(facebookUrl.text==""){
            buttonFacebook.isEnabled = false
        }
        else{
            buttonFacebook.isEnabled = true
        }
        if(twitterUrl.text == ""){
            buttonTwitter.isEnabled = false
        }
        else{
            buttonTwitter.isEnabled = true
        }
        if(instagramUrl.text == ""){
            buttonInstagram.isEnabled = false
        }
        else{
            buttonInstagram.isEnabled = true
        }
        if(webUrl.text == ""){
            buttonWeb.isEnabled = false
            buttonWeb.setTitle("", for: .normal)
        }
        else{
            buttonWeb.isEnabled = true
            buttonWeb.setTitle("Web Oficial", for: .normal)
        }
        modalNetworks.isHidden = true
    }
    
    
    override func viewDidLoad() {
        modalNetworks.isHidden = true
        controlPagina.numberOfPages = Int(ceil(CGFloat(items.count) / CGFloat(9)))
        
        var attrSegment = NSDictionary()
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            attrSegment = NSDictionary(object: UIFont(name: "Exo-Regular", size: 10.0)!, forKey: NSFontAttributeName as NSCopying)
            break
        case .pad:
            attrSegment = NSDictionary(object: UIFont(name: "Exo-Regular", size: 24.0)!, forKey: NSFontAttributeName as NSCopying)
            break
        default:
            attrSegment = NSDictionary(object: UIFont(name: "Exo-Regular", size: 10.0)!, forKey: NSFontAttributeName as NSCopying)
            break
        }
        
        UISegmentedControl.appearance().setTitleTextAttributes(attrSegment as? [AnyHashable : Any], for: .normal)
        
        CView.autoresizingMask = UIViewAutoresizing.flexibleWidth
        
        
        Follow.layer.borderWidth = 2
//        Follow.layer.borderColor = UIColor(displayP3Red: 0.0, green: 196.0, blue: 180.0, alpha: 1.0).cgColor
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
    
    
}
